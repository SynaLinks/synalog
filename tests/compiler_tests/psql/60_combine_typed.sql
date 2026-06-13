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
WITH t_0_Words AS (SELECT * FROM (
  
    SELECT
      'apple' AS word
   UNION ALL
  
    SELECT
      'banana' AS word
   UNION ALL
  
    SELECT
      'cherry' AS word
  
) AS UNUSED_TABLE_NAME  )
SELECT
  CAST((SELECT
  MAX((CASE WHEN x_6 = 0 THEN Words.word ELSE NULL END)) AS logica_value
FROM
  t_0_Words AS Words, UNNEST(ARRAY[0]::numeric[]) as x_6) AS text) AS longest ORDER BY longest;