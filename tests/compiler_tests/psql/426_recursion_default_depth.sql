-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_1_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_21) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 20 - 1) as x), '{}')) as x_21
      WHERE
        (0 < 8) AND
        (1 = 0) AND
        (x_21 = 0)
     UNION ALL
    
      SELECT
        ((x_37) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 20 - 1) as x), '{}')) as x_37, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 20 - 1) as x), '{}')) as x_43
      WHERE
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(x_37, 0) = COALESCE(((x_43) + (1)), 0) AND (x_37 IS NULL) = (((x_43) + (1)) IS NULL)) AND
        (x_43 = 0)
     UNION ALL
    
      SELECT
        ((x_59) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 20 - 1) as x), '{}')) as x_59, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 20 - 1) as x), '{}')) as x_66, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 20 - 1) as x), '{}')) as x_72
      WHERE
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(x_59, 0) = COALESCE(((x_66) + (1)), 0) AND (x_59 IS NULL) = (((x_66) + (1)) IS NULL)) AND
        (COALESCE(x_66, 0) = COALESCE(((x_72) + (1)), 0) AND (x_66 IS NULL) = (((x_72) + (1)) IS NULL)) AND
        (x_72 = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_79) + (1)) AS y,
  ((t_15_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_15_Reach_RecursiveCte, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 20 - 1) as x), '{}')) as x_79
WHERE
  (t_15_Reach_RecursiveCte.synalog_step < 8) AND
  (COALESCE(t_15_Reach_RecursiveCte.y, 0) = COALESCE(x_79, 0) AND (t_15_Reach_RecursiveCte.y IS NULL) = (x_79 IS NULL))),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.y AS y
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.y)
SELECT
  SUM(1) AS n
FROM
  t_0_Reach AS Reach;