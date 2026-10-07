-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_U AS (SELECT * FROM (
  
    SELECT
      1 AS u
   UNION ALL
  
    SELECT
      2 AS u
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_U.u AS u,
  CAST((SELECT
  BOOL_AND((CASE WHEN x_4 = 0 THEN false ELSE NULL END)) AS logica_value
FROM
  UNNEST(ARRAY[0]) as x_4
WHERE
  (t_0_U.u = 1)) AS bool) AS l
FROM
  t_1_U AS t_0_U ORDER BY u;