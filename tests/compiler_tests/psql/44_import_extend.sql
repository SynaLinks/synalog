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
WITH t_1_Values AS (SELECT * FROM (
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Values.a AS a,
  Values.b AS b,
  ((((Values.a) * (Values.a))) + (((Values.b) * (Values.b)))) AS result
FROM
  t_1_Values AS Values ORDER BY a;