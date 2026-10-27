-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_Orders AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_0_Filter AS (SELECT
  t_1_Orders.customer_name AS customer_name
FROM
  t_2_Orders AS t_1_Orders
GROUP BY t_1_Orders.customer_name)
SELECT
  Filter.customer_name AS customer_name,
  SUM(Orders.amount) AS revenue
FROM
  t_0_Filter AS Filter, t_2_Orders AS Orders
WHERE
  (Orders.customer_name IS NOT DISTINCT FROM Filter.customer_name)
GROUP BY Filter.customer_name ORDER BY customer_name;