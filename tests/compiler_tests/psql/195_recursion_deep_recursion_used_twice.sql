-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_2_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS logica_step
     UNION ALL
    
      SELECT
        ((x_25) + (1)) AS y,
        ((0) + (1)) AS logica_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_25
      WHERE
        (0 < 21) AND
        (1 = 0) AND
        (x_25 = 0)
     UNION ALL
    
      SELECT
        ((x_41) + (1)) AS y,
        ((((0) + (1))) + (1)) AS logica_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_41, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_47
      WHERE
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_41 = ((x_47) + (1))) AND
        (x_47 = 0)
     UNION ALL
    
      SELECT
        ((x_63) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS logica_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_63, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_70, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_76
      WHERE
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_63 = ((x_70) + (1))) AND
        (x_70 = ((x_76) + (1))) AND
        (x_76 = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_83) + (1)) AS y,
  ((t_16_Reach_RecursiveCte.logica_step) + (1)) AS logica_step
FROM
  t_2_Reach_RecursiveCte AS t_16_Reach_RecursiveCte, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_83
WHERE
  (t_16_Reach_RecursiveCte.logica_step < 21) AND
  (t_16_Reach_RecursiveCte.y = x_83)),
t_1_Reach AS (SELECT
  Reach_RecursiveCte.y AS y
FROM
  t_2_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.y),
t_0_Far AS (SELECT
  MAX(Reach.y) AS m
FROM
  t_1_Reach AS Reach),
t_18_Count AS (SELECT
  SUM(1) AS n
FROM
  t_1_Reach AS t_19_Reach)
SELECT
  Far.m AS m,
  Count.n AS n
FROM
  t_0_Far AS Far, t_18_Count AS Count;