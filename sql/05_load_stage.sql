('st-005', 'cust-005', 'agent-02', 'Card not working', 'closed', '120'),
    ('st-006', 'cust-007', 'agent-01', 'Platinum benefits', 'closed', '30'),
    ('st-007', 'cust-004', 'agent-03', 'How to block card', 'closed', '2'),
    ('st-008', 'cust-008', 'agent-02', 'App is slow', 'closed', '45'),
    ('st-009', 'cust-010', 'agent-01', 'Mistake in transaction', 'pending', NULL),
    ('st-010', 'cust-006', 'agent-03', 'Failed login', 'closed', 'N/A');



Insert into stage_hordiienko.customers (
    customer_id, full_name, email_address, city, registration_date, client_level, birth_date
)
Select
    customer_id,
    full_name,
    email_address,
    city,
    Parse_date('%d.%m.%Y', registration_date),
    client_level,
    Parse_date('%d.%m.%Y', birth_date)
From
    raw_hordiienko.customers;

Insert into stage_hordiienko.transactions (
    transaction_id, customer_id, transaction_date, description, amount, category_code
)
Select
    transaction_id,
    customer_id,
    Parse_date('%d.%m.%Y', transaction_date),
    description,
    Safe_cast(amount as decimal),
    category_code
From
    raw_hordiienko.transactions;

Insert into stage_hordiienko.cashback_accruals (
    accrual_id, transaction_id, customer_id, cashback_category, accrual_amount_uah
)
Select
    accrual_id,
    transaction_id,
    customer_id,
    cashback_category,
    Safe_cast(accrual_amount_uah as decimal)
From
    raw_hordiienko.cashback_accruals;

Insert into stage_hordiienko.jars (
    jar_id, customer_id, jar_name, goal_amount, current_balance, creation_date
)
Select
    jar_id,
    customer_id,
    jar_name,
    Safe_cast(goal_amount as decimal),
    Safe_cast(current_balance as decimal),
    Parse_date('%d.%m.%Y', creation_date)
From
    raw_hordiienko.jars;

Insert into stage_hordiienko.support_tickets (
    ticket_id, customer_id, agent_id, ticket_subject, ticket_status, time_to_solve_minutes
)
Select
    ticket_id,
    customer_id,
    agent_id,
    ticket_subject,
    ticket_status,
    Safe_cast(time_to_solve_minutes as int64)
From
    raw_hordiienko.support_tickets;



