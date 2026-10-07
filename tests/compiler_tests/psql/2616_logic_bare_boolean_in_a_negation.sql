-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      true AS b,
      'ab' AS s
   UNION ALL
  
    SELECT
      2 AS x,
      false AS b,
      'ba' AS s
   UNION ALL
  
    SELECT
      3 AS x,
      CAST(null AS bool) AS b,
      CAST(null AS text) AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_0_V AS t_1_V, UNNEST(ARRAY[0]) as x_6
  WHERE
    t_1_V.b AND
    (t_1_V.x = V.x)) AS numeric) IS NULL) ORDER BY x;