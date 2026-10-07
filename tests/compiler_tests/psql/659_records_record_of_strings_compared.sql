-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord10754701151401705651') then create type logicarecord10754701151401705651 as ("k" text, "v" text); end if; END $$;
WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      ROW('a', 'x')::logicarecord10754701151401705651 AS r
   UNION ALL
  
    SELECT
      ROW('b', 'y')::logicarecord10754701151401705651 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (t_0_V.r).v AS v
FROM
  t_1_V AS t_0_V
WHERE
  ((t_0_V.r).k = 'b');