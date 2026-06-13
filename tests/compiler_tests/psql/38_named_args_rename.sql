-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
WITH t_0_Orders AS (SELECT * FROM (
  
    SELECT
      1 AS order_id,
      101 AS customer_id,
      50 AS amount,
      'shipped' AS status
   UNION ALL
  
    SELECT
      2 AS order_id,
      102 AS customer_id,
      75 AS amount,
      'pending' AS status
   UNION ALL
  
    SELECT
      3 AS order_id,
      101 AS customer_id,
      100 AS amount,
      'shipped' AS status
   UNION ALL
  
    SELECT
      4 AS order_id,
      103 AS customer_id,
      25 AS amount,
      'cancelled' AS status
  
) AS UNUSED_TABLE_NAME  ),
t_1_Customers AS (SELECT * FROM (
  
    SELECT
      101 AS customer_id,
      'Alice' AS name,
      'gold' AS tier
   UNION ALL
  
    SELECT
      102 AS customer_id,
      'Bob' AS name,
      'silver' AS tier
   UNION ALL
  
    SELECT
      103 AS customer_id,
      'Charlie' AS name,
      'bronze' AS tier
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Orders.order_id AS oid,
  Customers.name AS cname,
  Orders.amount AS oamt
FROM
  t_0_Orders AS Orders, t_1_Customers AS Customers
WHERE
  (Customers.customer_id = Orders.customer_id) ORDER BY oid;