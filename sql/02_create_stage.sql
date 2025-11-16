Create table if not exists stage_hordiienko.customers (
    customer_id string,
    full_name string,
    email_address string,
    city string,
    registration_date date,
    client_level string,
    birth_date date
);

Create table if not exists stage_hordiienko.transactions (
    transaction_id string,
    customer_id string,
    transaction_date date,
    description string,
    amount decimal,
    category_code string
);

Create table if not exists stage_hordiienko.cashback_accruals (
    accrual_id string,
    transaction_id string,
    customer_id string,
    cashback_category string,
    accrual_amount_uah decimal
);

Create table if not exists stage_hordiienko.jars (
    jar_id string,
    customer_id string,
    jar_name string,
    goal_amount decimal,
    current_balance decimal,
    creation_date date
);

Create table if not exists stage_hordiienko.support_tickets (
    ticket_id string,
    customer_id string,
    agent_id string,
    ticket_subject string,
    ticket_status string,
    time_to_solve_minutes int64
);



