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
      'North' AS col0,
      'A' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'North' AS col0,
      'B' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'North' AS col0,
      'A' AS col1,
      200 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'A' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'B' AS col1,
      180 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'C' AS col1,
      90 AS col2
   UNION ALL
  
    SELECT
      'East' AS col0,
      'A' AS col1,
      300 AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_0_TotalByRegion AS (SELECT
  Sales.col0 AS col0,
  SUM(Sales.col2) AS total
FROM
  t_1_Sales AS Sales
GROUP BY Sales.col0)
SELECT
  TotalByRegion.col0 AS region,
  TotalByRegion.total AS total
FROM
  t_0_TotalByRegion AS TotalByRegion ORDER BY region;