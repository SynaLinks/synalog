-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_Segments_Customer AS (SELECT * FROM (
  
    SELECT
      1 AS customer_id,
      'enterprise' AS tier
   UNION ALL
  
    SELECT
      2 AS customer_id,
      'smb' AS tier
  
) AS UNUSED_TABLE_NAME  ),
t_1_Enterprise AS (SELECT
  Segments_Customer.customer_id AS customer_id
FROM
  t_2_Segments_Customer AS Segments_Customer
WHERE
  (Segments_Customer.tier = 'enterprise')
GROUP BY Segments_Customer.customer_id),
t_3_Segments_Order AS (SELECT * FROM (
  
    SELECT
      1 AS customer_id,
      100 AS amount
   UNION ALL
  
    SELECT
      2 AS customer_id,
      7 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_EnterpriseRevenue AS (SELECT
  SUM(Segments_Order.amount) AS revenue
FROM
  t_1_Enterprise AS Enterprise, t_3_Segments_Order AS Segments_Order
WHERE
  (Segments_Order.customer_id = Enterprise.customer_id))
SELECT
  EnterpriseRevenue.revenue AS revenue
FROM
  t_0_EnterpriseRevenue AS EnterpriseRevenue ORDER BY revenue;