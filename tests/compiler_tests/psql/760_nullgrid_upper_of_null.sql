-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      CAST(null AS text) AS s
   UNION ALL
  
    SELECT
      2 AS k,
      'ab' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.k AS k,
  CASE WHEN (t_0_V.k = 1) THEN CASE WHEN (UPPER(t_0_V.s) IS NULL) THEN null ELSE 'bad' END ELSE 'ok' END AS v
FROM
  t_1_V AS t_0_V ORDER BY k;