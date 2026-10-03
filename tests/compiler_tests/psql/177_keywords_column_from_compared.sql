-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      '2026-01-01' AS "from"
   UNION ALL
  
    SELECT
      '2026-02-01' AS "from"
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P."from" AS "from"
FROM
  t_0_P AS P
WHERE
  (P."from" > '2026-01-15');