-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      CAST(null AS numeric) AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R.x AS x
FROM
  t_0_R AS R
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_3 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    UNNEST(ARRAY[0]) as x_3
  WHERE
    (R.x IS NULL)) AS numeric) IS NULL);