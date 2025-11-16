INSERT INTO raw_hordiienko.customers (
    customer_id, full_name, email_address, city, registration_date, client_level, birth_date
)
VALUES
    ('cust-001', 'Олена Петренко', 'olena@gmail.com', 'Kyiv', '14.11.2023', 'platinum', '15.05.1990'),
    ('cust-002', 'Андрій Іванов', 'andriy@gmail.com', 'Lviv', '01.01.2024', 'standard', '20.03.1985'),
    ('cust-003', 'Ірина Ковальчук', 'ira@gmail.com', 'Odesa', '05.03.2024', 'standard', '10.11.1995'),
    ('cust-004', 'Сергій Мельник', 'serhiy@gmail.com', 'Kyiv', '20.04.2024', 'iron', '02.02.1980'),
    ('cust-005', 'Наталія Бондар', 'natali@gmail.com', 'Lviv', '15.06.2024', 'standard', '30.07.2001'),
    ('cust-006', 'Віктор Кравченко', 'viktor@gmail.com', 'Kharkiv', '01.07.2024', 'standard', '12.12.1992'),
    ('cust-007', 'Юлія Поліщук', 'yulia@gmail.com', 'Kyiv', '10.08.2024', 'platinum', '22.08.1988'),
    ('cust-008', 'Максим Ткаченко', 'max@gmail.com', 'Dnipro', '19.09.2024', 'standard', '05.04.1997'),
    ('cust-009', 'Ольга Шевченко', 'olga@gmail.com', 'Lviv', '25.10.2024', 'standard', '18.06.1993'),
    ('cust-010', 'Дмитро Лисенко', 'dmytro@gmail.com', 'Odesa', '30.11.2024', 'iron', '29.09.1975');
INSERT INTO raw_hordiienko.transactions (
    transaction_id, customer_id, transaction_date, description, amount, category_code
)
VALUES
    ('t-001', 'cust-001', '10.11.2025', 'Silpo Supermarket', '-150.75', '5411'),
    ('t-002', 'cust-002', '10.11.2025', 'Puzata Hata', '-80.00', '5812'),
    ('t-003', 'cust-001', '10.11.2025', 'Bolt', '-120.50', '4121'),
    ('t-004', 'cust-003', '11.11.2025', 'SportLife', '-1000.00', '7997'),
    ('t-005', 'cust-004', '11.11.2025', 'WOG', '-1500.00', '5541'),
    ('t-006', 'cust-005', '12.11.2025', 'Eva Store', '-250.20', '5331'),
    ('t-007', 'cust-001', '12.11.2025', 'Mamamia Pizza', '-450.00', '5812'),
    ('t-008', 'cust-007', '13.11.2025', 'Rozetka', '-2500.00', '5732'),
    ('t-009', 'cust-010', '13.11.2025', 'OKKO', '-2000.00', '5541'),
    ('t-010', 'cust-002', '14.11.2025', 'Silpo Supermarket', '-300.10', '5411');
INSERT INTO raw_hordiienko.cashback_accruals (
    accrual_id, transaction_id, customer_id, cashback_category, accrual_amount_uah
)
VALUES
    ('cb-001', 't-001', 'cust-001', 'Grocery', '3.01'),
    ('cb-002', 't-003', 'cust-001', 'Taxi', '12.05'),
    ('cb-003', 't-004', 'cust-003', 'Sport', '50.00'),
    ('cb-004', 't-005', 'cust-004', 'Gas', '30.00'),
    ('cb-005', 't-007', 'cust-001', 'Restaurant', '9.00'),
    ('cb-006', 't-008', 'cust-007', 'Electronics', '50.00'),
    ('cb-007', 't-009', 'cust-010', 'Gas', '40.00'),
    ('cb-008', 't-010', 'cust-002', 'Grocery', '6.00'),
    ('cb-009', 't-011', 'cust-003', 'Books', '15.50'),
    ('cb-010', 't-012', 'cust-004', 'Restaurant', '22.00');
INSERT INTO raw_hordiienko.jars (
    jar_id, customer_id, jar_name, goal_amount, current_balance, creation_date
)
VALUES
    ('jar-001', 'cust-001', 'На відпустку', '50000', '12500.50', '01.06.2024'),
    ('jar-002', 'cust-002', 'Ноутбук', '40000', '40000.00', '15.01.2024'),
    ('jar-003', 'cust-003', 'Подарунок', '5000', '1500.00', '10.10.2024'),
    ('jar-004', 'cust-004', 'На авто', '500000', '150000.00', '01.03.2024'),
    ('jar-005', 'cust-001', 'Ремонт', '100000', '30000.00', '20.07.2024'),
    ('jar-006', 'cust-007', 'Телефон', '35000', '10000.00', '01.09.2024'),
    ('jar-007', 'cust-010', 'Донат', '10000', '500.00', '05.11.2024'),
    ('jar-008', 'cust-002', 'Одяг', '7000', '0.00', '08.08.2024'),
    ('jar-009', 'cust-005', 'Навчання', '25000', '12000.00', '11.05.2024'),
    ('jar-010', 'cust-008', 'Велосипед', '15000', '7000.00', '22.04.2024');
INSERT INTO raw_hordiienko.support_tickets (
    ticket_id, customer_id, agent_id, ticket_subject, ticket_status, time_to_solve_minutes
)
VALUES
    ('st-001', 'cust-001', 'agent-01', 'Cannot complete payment', 'closed', '15'),
    ('st-002', 'cust-002', 'agent-02', 'Forgot PIN', 'closed', '5'),
    ('st-003', 'cust-001', 'agent-01', 'Where is my cashback?', 'pending', NULL),
    ('st-004', 'cust-003', 'agent-03', 'Question about "Jars"', 'closed', '10'),