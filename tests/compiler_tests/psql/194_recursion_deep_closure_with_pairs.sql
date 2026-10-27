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
        (0 < 21) AND
        (1 = 0) AND
        (COALESCE(x_36, 0) = COALESCE(((x_42) + (1)), 0) AND (x_36 IS NULL) = (((x_42) + (1)) IS NULL))
     UNION ALL
    
      SELECT
        x_78 AS x,
        ((x_64) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_64, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_72, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_78
      WHERE
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (COALESCE(x_64, 0) = COALESCE(((x_72) + (1)), 0) AND (x_64 IS NULL) = (((x_72) + (1)) IS NULL)) AND
        (COALESCE(x_72, 0) = COALESCE(((x_78) + (1)), 0) AND (x_72 IS NULL) = (((x_78) + (1)) IS NULL))
     UNION ALL
    
      SELECT
        x_123 AS x,
        ((x_100) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_100, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_109, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_117, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_123
      WHERE
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (COALESCE(x_100, 0) = COALESCE(((x_109) + (1)), 0) AND (x_100 IS NULL) = (((x_109) + (1)) IS NULL)) AND
        (COALESCE(x_109, 0) = COALESCE(((x_117) + (1)), 0) AND (x_109 IS NULL) = (((x_117) + (1)) IS NULL)) AND
        (COALESCE(x_117, 0) = COALESCE(((x_123) + (1)), 0) AND (x_117 IS NULL) = (((x_123) + (1)) IS NULL))
     UNION ALL
    
      SELECT
        x_177 AS x,
        ((x_145) + (1)) AS y,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_145, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_154, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_163, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_171, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_177
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 21) AND
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (COALESCE(x_145, 0) = COALESCE(((x_154) + (1)), 0) AND (x_145 IS NULL) = (((x_154) + (1)) IS NULL)) AND
        (COALESCE(x_154, 0) = COALESCE(((x_163) + (1)), 0) AND (x_154 IS NULL) = (((x_163) + (1)) IS NULL)) AND
        (COALESCE(x_163, 0) = COALESCE(((x_171) + (1)), 0) AND (x_163 IS NULL) = (((x_171) + (1)) IS NULL)) AND
        (COALESCE(x_171, 0) = COALESCE(((x_177) + (1)), 0) AND (x_171 IS NULL) = (((x_177) + (1)) IS NULL))
     UNION ALL
    
      SELECT
        x_240 AS x,
        ((x_199) + (1)) AS y,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_199, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_208, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_217, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_226, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_234, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 4 - 1) as x), '{}')) as x_240
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 21) AND
        (((((((0) + (1))) + (1))) + (1)) < 21) AND
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (COALESCE(x_199, 0) = COALESCE(((x_208) + (1)), 0) AND (x_199 IS NULL) = (((x_208) + (1)) IS NULL)) AND
        (COALESCE(x_208, 0) = COALESCE(((x_217) + (1)), 0) AND (x_208 IS NULL) = (((x_217) + (1)) IS NULL)) AND
        (COALESCE(x_217, 0) = COALESCE(((x_226) + (1)), 0) AND (x_217 IS NULL) = (((x_226) + (1)) IS NULL)) AND
        (COALESCE(x_226, 0) = COALESCE(((x_234) + (1)), 0) AND (x_226 IS NULL) = (((x_234) + (1)) IS NULL)) AND
        (COALESCE(x_234, 0) = COALESCE(((x_240) + (1)), 0) AND (x_234 IS NULL) = (((x_240) + (1)) IS NULL))
    
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
  (t_41_Reach_RecursiveCte.synalog_step < 21) AND
  (COALESCE(t_41_Reach_RecursiveCte.y, 0) = COALESCE(x_249, 0) AND (t_41_Reach_RecursiveCte.y IS NULL) = (x_249 IS NULL))),
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