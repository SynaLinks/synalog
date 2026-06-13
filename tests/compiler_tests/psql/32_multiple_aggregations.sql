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
WITH t_1_Sales AS (SELECT * FROM (
  
    SELECT
      'North' AS region,
      'A' AS product,
      100 AS amount
   UNION ALL
  
    SELECT
      'North' AS region,
      'B' AS product,
      150 AS amount
   UNION ALL
  
    SELECT
      'South' AS region,
      'A' AS product,
      200 AS amount
   UNION ALL
  
    SELECT
      'South' AS region,
      'B' AS product,
      75 AS amount
   UNION ALL
  
    SELECT
      'East' AS region,
      'A' AS product,
      300 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_RegionStats AS (SELECT
  Sales.region AS region,
  SUM(Sales.amount) AS total,
  SUM(1) AS count,
  MAX(Sales.amount) AS max_sale,
  MIN(Sales.amount) AS min_sale
FROM
  t_1_Sales AS Sales
GROUP BY Sales.region ORDER BY region)
SELECT
  RegionStats.region AS region,
  RegionStats.total AS total,
  RegionStats.count AS count,
  RegionStats.max_sale AS max_sale,
  RegionStats.min_sale AS min_sale
FROM
  t_0_RegionStats AS RegionStats ORDER BY region;