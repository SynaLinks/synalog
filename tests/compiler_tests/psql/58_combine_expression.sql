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
WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      'N' AS region,
      10 AS amount
   UNION ALL
  
    SELECT
      'N' AS region,
      20 AS amount
   UNION ALL
  
    SELECT
      'S' AS region,
      30 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  CAST((SELECT
  SUM((CASE WHEN x_6 = 0 THEN Sales.amount ELSE NULL END)) AS logica_value
FROM
  t_0_Sales AS Sales, UNNEST(ARRAY[0]::numeric[]) as x_6) AS numeric) AS total ORDER BY total;