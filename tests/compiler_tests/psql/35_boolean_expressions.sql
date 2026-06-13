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
      2 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      5 AS a,
      5 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Filtered AS (SELECT
  Data.a AS a,
  Data.b AS b
FROM
  t_1_Data AS Data
WHERE
  (Data.a >= Data.b) ORDER BY a)
SELECT
  Filtered.a AS a,
  Filtered.b AS b
FROM
  t_0_Filtered AS Filtered ORDER BY a;