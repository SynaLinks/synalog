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
WITH t_1_RawData AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      10 AS col1
   UNION ALL
  
    SELECT
      2 AS col0,
      20 AS col1
   UNION ALL
  
    SELECT
      3 AS col0,
      30 AS col1
   UNION ALL
  
    SELECT
      4 AS col0,
      40 AS col1
   UNION ALL
  
    SELECT
      5 AS col0,
      50 AS col1
  
) AS UNUSED_TABLE_NAME  ),
t_0_Aggregated AS (SELECT
  SUM(((RawData.col1) * (2))) AS total,
  SUM(1) AS count
FROM
  t_1_RawData AS RawData
WHERE
  (RawData.col1 > 15))
SELECT
  Aggregated.total AS total,
  Aggregated.count AS count,
  ((Aggregated.total) / (Aggregated.count)) AS avg
FROM
  t_0_Aggregated AS Aggregated ORDER BY total;