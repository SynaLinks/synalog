-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
  (COALESCE(Orders.customer_name, '') = COALESCE(Filter.customer_name, '') AND (Orders.customer_name IS NULL) = (Filter.customer_name IS NULL))
GROUP BY Filter.customer_name ORDER BY customer_name;