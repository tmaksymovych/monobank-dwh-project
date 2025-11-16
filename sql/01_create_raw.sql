Create table if not exists raw_hordiienko.customers (
    customer_id string,
    full_name string,
    email_address string,
    city string,
    registration_date string,
    client_level string,
    birth_date string
);

Create table if not exists raw_hordiienko.transactions (
    transaction_id string,
    customer_id string,
    transaction_date string,
    description string,
    amount string,
    category_code string
);

Create table if not exists raw_hordiienko.cashback_accruals (
    accrual_id string,
    transaction_id string,
    customer_id string,
    cashback_category string,
    accrual_amount_uah string
);

Create table if not exists raw_hordiienko.jars (
    jar_id string,
    customer_id string,
    jar_name string,
    goal_amount string,
    current_balance string,
    creation_date string
);

Create table if not exists raw_hordiienko.support_tickets (
    ticket_id string,
    customer_id string,
    agent_id string,
    ticket_subject string,
    ticket_status string,
    time_to_solve_minutes string
);