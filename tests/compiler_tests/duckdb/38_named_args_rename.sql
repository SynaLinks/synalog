-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_0_Orders AS (SELECT * FROM (
  
    SELECT
      1 AS order_id,
      101 AS customer_id,
      50 AS amount,
      E'shipped' AS status
   UNION ALL
  
    SELECT
      2 AS order_id,
      102 AS customer_id,
      75 AS amount,
      E'pending' AS status
   UNION ALL
  
    SELECT
      3 AS order_id,
      101 AS customer_id,
      100 AS amount,
      E'shipped' AS status
   UNION ALL
  
    SELECT
      4 AS order_id,
      103 AS customer_id,
      25 AS amount,
      E'cancelled' AS status
  
) AS UNUSED_TABLE_NAME  ),
t_1_Customers AS (SELECT * FROM (
  
    SELECT
      101 AS customer_id,
      E'Alice' AS name,
      E'gold' AS tier
   UNION ALL
  
    SELECT
      102 AS customer_id,
      E'Bob' AS name,
      E'silver' AS tier
   UNION ALL
  
    SELECT
      103 AS customer_id,
      E'Charlie' AS name,
      E'bronze' AS tier
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Orders.order_id AS oid,
  Customers.name AS cname,
  Orders.amount AS oamt
FROM
  t_0_Orders AS Orders, t_1_Customers AS Customers
WHERE
  (Customers.customer_id = Orders.customer_id) ORDER BY oid;