-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_1_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        x_15 AS x,
        ((x_15) + (1)) AS y,
        0 AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_15
     UNION ALL
    
      SELECT
        x_42 AS x,
        ((x_36) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_36, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_42
      WHERE
        (0 < 25) AND
        (1 = 0) AND
        (x_36 = ((x_42) + (1)))
     UNION ALL
    
      SELECT
        x_78 AS x,
        ((x_64) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_64, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_72, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_78
      WHERE
        (((0) + (1)) < 25) AND
        (0 < 25) AND
        (1 = 0) AND
        (x_64 = ((x_72) + (1))) AND
        (x_72 = ((x_78) + (1)))
     UNION ALL
    
      SELECT
        x_123 AS x,
        ((x_100) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_100, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_109, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_117, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_123
      WHERE
        (((((0) + (1))) + (1)) < 25) AND
        (((0) + (1)) < 25) AND
        (0 < 25) AND
        (1 = 0) AND
        (x_100 = ((x_109) + (1))) AND
        (x_109 = ((x_117) + (1))) AND
        (x_117 = ((x_123) + (1)))
     UNION ALL
    
      SELECT
        x_177 AS x,
        ((x_145) + (1)) AS y,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_145, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_154, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_163, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_171, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_177
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 25) AND
        (((((0) + (1))) + (1)) < 25) AND
        (((0) + (1)) < 25) AND
        (0 < 25) AND
        (1 = 0) AND
        (x_145 = ((x_154) + (1))) AND
        (x_154 = ((x_163) + (1))) AND
        (x_163 = ((x_171) + (1))) AND
        (x_171 = ((x_177) + (1)))
     UNION ALL
    
      SELECT
        x_240 AS x,
        ((x_199) + (1)) AS y,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_199, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_208, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_217, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_226, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_234, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_240
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 25) AND
        (((((((0) + (1))) + (1))) + (1)) < 25) AND
        (((((0) + (1))) + (1)) < 25) AND
        (((0) + (1)) < 25) AND
        (0 < 25) AND
        (1 = 0) AND
        (x_199 = ((x_208) + (1))) AND
        (x_208 = ((x_217) + (1))) AND
        (x_217 = ((x_226) + (1))) AND
        (x_226 = ((x_234) + (1))) AND
        (x_234 = ((x_240) + (1)))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_41_Reach_RecursiveCte.x AS x,
  ((x_249) + (1)) AS y,
  ((t_41_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_41_Reach_RecursiveCte, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_249
WHERE
  (t_41_Reach_RecursiveCte.synalog_step < 25) AND
  (t_41_Reach_RecursiveCte.y = x_249)),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.x AS x,
  Reach_RecursiveCte.y AS y
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.x, Reach_RecursiveCte.y)
SELECT
  SUM(1) AS n
FROM
  t_0_Reach AS Reach;