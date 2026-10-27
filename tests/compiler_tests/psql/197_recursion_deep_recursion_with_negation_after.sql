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
        ((x_27) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_27
      WHERE
        (0 < 22) AND
        (1 = 0) AND
        (x_27 = 0)
     UNION ALL
    
      SELECT
        ((x_43) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_43, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_49
      WHERE
        (((0) + (1)) < 22) AND
        (0 < 22) AND
        (1 = 0) AND
        (COALESCE(x_43, 0) = COALESCE(((x_49) + (1)), 0) AND (x_43 IS NULL) = (((x_49) + (1)) IS NULL)) AND
        (x_49 = 0)
     UNION ALL
    
      SELECT
        ((x_65) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_65, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_72, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_78
      WHERE
        (((((0) + (1))) + (1)) < 22) AND
        (((0) + (1)) < 22) AND
        (0 < 22) AND
        (1 = 0) AND
        (COALESCE(x_65, 0) = COALESCE(((x_72) + (1)), 0) AND (x_65 IS NULL) = (((x_72) + (1)) IS NULL)) AND
        (COALESCE(x_72, 0) = COALESCE(((x_78) + (1)), 0) AND (x_72 IS NULL) = (((x_78) + (1)) IS NULL)) AND
        (x_78 = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_85) + (1)) AS y,
  ((t_15_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_15_Reach_RecursiveCte, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_85
WHERE
  (t_15_Reach_RecursiveCte.synalog_step < 22) AND
  (COALESCE(t_15_Reach_RecursiveCte.y, 0) = COALESCE(x_85, 0) AND (t_15_Reach_RecursiveCte.y IS NULL) = (x_85 IS NULL))),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.y AS y
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.y)
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[10, 22, 23]) as x_3
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_0_Reach AS Reach, UNNEST(ARRAY[0]) as x_6
  WHERE
    (COALESCE(Reach.y, 0) = COALESCE(x_3, 0) AND (Reach.y IS NULL) = (x_3 IS NULL))) AS numeric) IS NULL) ORDER BY x;