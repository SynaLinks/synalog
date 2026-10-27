-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_2_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_25) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_25
      WHERE
        (0 < 21) AND
        (1 = 0) AND
        (x_25 = 0)
     UNION ALL
    
      SELECT
        ((x_41) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_41, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_47
      WHERE
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (COALESCE(x_41, 0) = COALESCE(((x_47) + (1)), 0) AND (x_41 IS NULL) = (((x_47) + (1)) IS NULL)) AND
        (x_47 = 0)
     UNION ALL
    
      SELECT
        ((x_63) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_63, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_70, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_76
      WHERE
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (COALESCE(x_63, 0) = COALESCE(((x_70) + (1)), 0) AND (x_63 IS NULL) = (((x_70) + (1)) IS NULL)) AND
        (COALESCE(x_70, 0) = COALESCE(((x_76) + (1)), 0) AND (x_70 IS NULL) = (((x_76) + (1)) IS NULL)) AND
        (x_76 = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_83) + (1)) AS y,
  ((t_16_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_2_Reach_RecursiveCte AS t_16_Reach_RecursiveCte, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_83
WHERE
  (t_16_Reach_RecursiveCte.synalog_step < 21) AND
  (COALESCE(t_16_Reach_RecursiveCte.y, 0) = COALESCE(x_83, 0) AND (t_16_Reach_RecursiveCte.y IS NULL) = (x_83 IS NULL))),
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