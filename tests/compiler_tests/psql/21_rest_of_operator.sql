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
WITH t_1_Data AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b,
      3 AS c,
      'x' AS d
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b,
      6 AS c,
      'y' AS d
   UNION ALL
  
    SELECT
      7 AS a,
      8 AS b,
      9 AS c,
      'z' AS d
  
) AS UNUSED_TABLE_NAME  ),
t_0_Subset AS (SELECT
  Data.c AS c,
  Data.d AS d
FROM
  t_1_Data AS Data ORDER BY d)
SELECT
  Subset.c AS c,
  Subset.d AS d
FROM
  t_0_Subset AS Subset ORDER BY d;