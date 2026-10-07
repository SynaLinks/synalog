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
      'John' AS customer_name,
      10 AS amount
   UNION ALL
  
    SELECT
      'John' AS customer_name,
      20 AS amount
   UNION ALL
  
    SELECT
      'Mary' AS customer_name,
      5 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Orders.customer_name AS customer_name,
  SUM(Orders.amount) AS revenue
FROM
  t_0_Orders AS Orders
WHERE
  ('John' = Orders.customer_name)
GROUP BY Orders.customer_name ORDER BY customer_name;