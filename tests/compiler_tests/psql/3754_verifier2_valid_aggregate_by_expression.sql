-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ((MOD(CAST(E.a AS numeric), NULLIF(CAST(2 AS numeric), 0))) = 1) AS odd,
  SUM(1) AS n
FROM
  t_0_E AS E
GROUP BY ((MOD(CAST(E.a AS numeric), NULLIF(CAST(2 AS numeric), 0))) = 1) ORDER BY odd;