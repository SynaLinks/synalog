-- Seed data for exercising `synalog introspect` against a live PostgreSQL.
--
-- Two user schemas with overlapping table names, so the generated predicates
-- demonstrate schema-qualified naming (ShopCustomers vs AnalyticsCustomers)
-- and the columns survive the round-trip into Logica `# Tables` predicates.
--
-- This runs once, at container init (docker-entrypoint-initdb.d). It is additive
-- and lives in its own schemas, so it does not interfere with the e2e fixture
-- suite, which works in the default search path with `create ... if not exists`.

CREATE SCHEMA IF NOT EXISTS shop;
CREATE SCHEMA IF NOT EXISTS analytics;

CREATE TABLE shop.customers (
    id         integer PRIMARY KEY,
    full_name  text,
    email      text,
    created_at timestamp
);

CREATE TABLE shop.orders (
    id          integer PRIMARY KEY,
    customer_id integer REFERENCES shop.customers (id),
    amount      numeric,
    status      text
);

CREATE TABLE analytics.customers (
    id      integer PRIMARY KEY,
    segment text
);

CREATE TABLE analytics.events (
    event_id    integer PRIMARY KEY,
    customer_id integer,
    kind        text,
    occurred_at timestamp
);

INSERT INTO shop.customers VALUES
    (1, 'Ada Lovelace',  'ada@example.com',  '2024-01-02 09:00:00'),
    (2, 'Alan Turing',   'alan@example.com', '2024-01-03 10:30:00');

INSERT INTO shop.orders VALUES
    (10, 1, 120.50, 'paid'),
    (11, 2,  75.00, 'pending');

INSERT INTO analytics.customers VALUES (1, 'enterprise'), (2, 'smb');

INSERT INTO analytics.events VALUES
    (100, 1, 'login',    '2024-01-05 08:00:00'),
    (101, 1, 'purchase', '2024-01-05 08:05:00');
