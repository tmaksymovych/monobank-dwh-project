Create table if not exists mart_hordiienko.dim_customer (
    customer_key int64,
    customer_id string,
    full_name string,
    city string,
    client_level string,
    age int64,
    registration_date date
);

Create table if not exists mart_hordiienko.dim_date (
    date_key int64,
    full_date date,
    day_of_week int64,
    day_name string,
    month int64,
    month_name string,
    quarter int64,
    year int64
);

Create table if not exists mart_hordiienko.dim_category (
    category_key int64,
    category_code string,
    description string,
    category_name string
);

Create table if not exists mart_hordiienko.fct_transactions (
    date_key int64,
    customer_key int64,
    category_key int64,
    transaction_id string,
    amount_uah decimal,
    cashback_amount_uah decimal
);