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
WITH t_1_Events1 AS (SELECT * FROM (
  
    SELECT
      'A' AS category,
      10 AS count
   UNION ALL
  
    SELECT
      'A' AS category,
      20 AS count
   UNION ALL
  
    SELECT
      'B' AS category,
      15 AS count
  
) AS UNUSED_TABLE_NAME  ),
t_0_Total1 AS (SELECT
  Events1.category AS category,
  SUM(Events1.count) AS total
FROM
  t_1_Events1 AS Events1
GROUP BY Events1.category),
t_1_Events2 AS (SELECT * FROM (
  
    SELECT
      'B' AS category,
      5 AS count
   UNION ALL
  
    SELECT
      'C' AS category,
      25 AS count
   UNION ALL
  
    SELECT
      'C' AS category,
      30 AS count
  
) AS UNUSED_TABLE_NAME  ),
t_0_Total2 AS (SELECT
  Events2.category AS category,
  SUM(Events2.count) AS total
FROM
  t_1_Events2 AS Events2
GROUP BY Events2.category)
SELECT * FROM (
  
    SELECT
      'events1' AS source,
      Total1.category AS category,
      Total1.total AS total
    FROM
      t_0_Total1 AS Total1
   UNION ALL
  
    SELECT
      'events2' AS source,
      Total2.category AS category,
      Total2.total AS total
    FROM
      t_0_Total2 AS Total2
  
) AS UNUSED_TABLE_NAME  ORDER BY source, category ;