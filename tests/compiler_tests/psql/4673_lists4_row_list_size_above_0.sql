-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_L AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[1, 2, 3] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      CAST('{}' AS numeric[]) AS l
   UNION ALL
  
    SELECT
      3 AS k,
      ARRAY[7] AS l
   UNION ALL
  
    SELECT
      4 AS k,
      ARRAY[5, 5, 9, 1] AS l
   UNION ALL
  
    SELECT
      5 AS k,
      CAST(null AS numeric[]) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  CARDINALITY((SELECT
  ARRAY_AGG((CASE WHEN x_6 = 0 THEN x_5 ELSE NULL END)) AS logica_value
FROM
  UNNEST(t_0_L.l) as x_5, UNNEST(ARRAY[0]) as x_6
WHERE
  (x_5 > 0))) AS v
FROM
  t_1_L AS t_0_L ORDER BY k;