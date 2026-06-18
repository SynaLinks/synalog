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
-- Logica type: logicarecord183863755
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord183863755') then create type logicarecord183863755 as (arg text, value numeric); end if;
-- Logica type: logicarecord462007516
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord462007516') then create type logicarecord462007516 as (argpod text); end if;
-- Logica type: logicarecord68214556
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord68214556') then create type logicarecord68214556 as (arg logicarecord462007516, value numeric); end if;
END $$;
WITH t_2_Sales AS (SELECT * FROM (
  
    SELECT
      'North' AS col0,
      'Q1' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'North' AS col0,
      'Q2' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'North' AS col0,
      'Q3' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'Q1' AS col1,
      200 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'Q2' AS col1,
      180 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'Q3' AS col1,
      220 AS col2
   UNION ALL
  
    SELECT
      'East' AS col0,
      'Q1' AS col1,
      90 AS col2
   UNION ALL
  
    SELECT
      'East' AS col0,
      'Q2' AS col1,
      110 AS col2
   UNION ALL
  
    SELECT
      'East' AS col0,
      'Q3' AS col1,
      95 AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_0_BestQuarter AS (SELECT
  Sales.col0 AS col0,
  ((ARRAY_AGG(ROW(Sales.col1)::logicarecord462007516 order by Sales.col2 desc))[1]).argpod AS best_quarter
FROM
  t_2_Sales AS Sales
GROUP BY Sales.col0)
SELECT
  BestQuarter.col0 AS region,
  BestQuarter.best_quarter AS best_quarter
FROM
  t_0_BestQuarter AS BestQuarter ORDER BY region;