-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_4_S AS (SELECT * FROM (
  
    SELECT
      'north' AS r,
      1 AS d,
      5 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      2 AS d,
      8 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      3 AS d,
      3 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      5 AS d,
      9 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      6 AS d,
      1 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      1 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      2 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      4 AS d,
      2 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      5 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      2 AS d,
      4 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      3 AS d,
      11 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      4 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      5 AS d,
      10 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      7 AS d,
      3 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_3_D AS (SELECT
  S.d AS d
FROM
  t_4_S AS S
WHERE
  (S.r = 'east')
GROUP BY S.d)
SELECT
  t_1_D.d AS first,
  MIN(t_2_D.d) AS last
FROM
  t_3_D AS t_1_D, t_3_D AS t_2_D
WHERE
  (t_2_D.d >= t_1_D.d) AND
  (CAST((SELECT
    MIN((CASE WHEN x_15 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_3_D AS t_6_D, UNNEST(ARRAY[0]) as x_15
  WHERE
    (t_6_D.d = ((t_1_D.d) - (1)))) AS numeric) IS NULL) AND
  (CAST((SELECT
    MIN((CASE WHEN x_18 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_3_D AS t_7_D, UNNEST(ARRAY[0]) as x_18
  WHERE
    (t_7_D.d = ((t_2_D.d) + (1)))) AS numeric) IS NULL)
GROUP BY t_1_D.d ORDER BY first, last;
