Insert into mart_hordiienko.dim_customer (
    customer_key, customer_id, full_name, city, client_level, age, registration_date
)
Select
    Farm_fingerprint(customer_id) as customer_key,
    customer_id,
    full_name,
    city,
    client_level,
    date_diff(current_date(), birth_date, year) as age,
    registration_date
FROM
    stage_hordiienko.customers;

Insert into mart_hordiienko.dim_category (
    category_key, category_code, description, category_name
)
Select
    Farm_fingerprint(category_code) as category_key,
    category_code,
    description,
    Case
        When category_code = '5411' Then 'Продукти та супермаркети'
        When category_code = '5812' Then 'Кафе та ресторани'
        When category_code = '5541' Then 'Розваги та спорт'
        Else 'Інше'
    End as category_name
From (
    Select distinct category_code, description
    From stage_hordiienko.transactions
);

Insert into mart_hordiienko.dim_date (
    date_key, full_date, day_of_week, day_name, month, month_name, quarter, year
)
Select
   Safe_cast(Format_date('%Y%m%d', d) as int64) as date_key,
   d as full_date,
   Extract(DAYOFWEEK from d) as day_of_week,
   FORMAT_DATE('%A', d) as day_name,
   Extract(month from d) as month,
   Format_date('%B', d) as month_name,
   Extract(quarter from d) as quarter,
   Extract(Year from d) as year
From
   Unnest(GENERATE_DATE_ARRAY('2020-01-01', '2030-12-31')) as d;
Insert into mart_hordiienko.fct_transactions (
    date_key,
    customer_key,
    category_key,
    transaction_id,
    amount_uah,
    cashback_amount_uah
)
Select
    dd.date_key,
    dc.customer_key,
    dcat.category_key,
    t.transaction_id,
    t.amount,
    cb.accrual_amount_uah
From
    stage_hordiienko.transactions t
Left join
    stage_hordiienko.cashback_accruals cb on t.transaction_id = cb.transaction_id
Left join
    mart_hordiienko.dim_customer dc on t.customer_id = dc.customer_id
Left join
    mart_hordiienko.dim_category dcat ON t.category_code = dcat.category_code
Left join
    mart_hordiienko.dim_date dd on t.transaction_date = dd.full_date;


Select
  c.city,
  c.client_level,
  Sum(f.amount_uah) as total_spending,
  Count(f.transaction_id) as number_of_transactions
From
  mart_hordiienko.fct_transactions f
Inner join
  mart_hordiienko.dim_customer c on f.customer_key = c.customer_key
Group by c.city,c.client_level
Order by total_spending desc;