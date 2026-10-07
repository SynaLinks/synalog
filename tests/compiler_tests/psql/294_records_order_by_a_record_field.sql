-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord6183533453950714317') then create type logicarecord6183533453950714317 as ("k" numeric); end if; END $$;
WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      ROW(2)::logicarecord6183533453950714317 AS r
   UNION ALL
  
    SELECT
      ROW(1)::logicarecord6183533453950714317 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (t_0_R.r).k AS k
FROM
  t_1_R AS t_0_R ORDER BY k;