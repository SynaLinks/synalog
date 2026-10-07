-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      3 AS s
   UNION ALL
  
    SELECT
      'b' AS n,
      9 AS s
   UNION ALL
  
    SELECT
      'c' AS n,
      1 AS s
   UNION ALL
  
    SELECT
      'd' AS n,
      5 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  CAST((SELECT
  SUM((CASE WHEN x_4 = 0 THEN 1 ELSE NULL END)) AS logica_value
FROM
  t_0_V AS V, UNNEST(ARRAY[0]) as x_4
WHERE
  ((MOD(CAST(V.s AS numeric), NULLIF(CAST(2 AS numeric), 0))) = 1)) AS numeric) AS t;