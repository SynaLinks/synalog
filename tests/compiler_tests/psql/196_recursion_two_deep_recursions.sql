-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_3_A_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_22) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_22
      WHERE
        (0 < 21) AND
        (1 = 0) AND
        (x_22 = 0)
     UNION ALL
    
      SELECT
        ((x_38) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_38, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_44
      WHERE
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (COALESCE(x_38, 0) = COALESCE(((x_44) + (1)), 0) AND (x_38 IS NULL) = (((x_44) + (1)) IS NULL)) AND
        (x_44 = 0)
     UNION ALL
    
      SELECT
        ((x_60) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_60, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_67, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_73
      WHERE
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (COALESCE(x_60, 0) = COALESCE(((x_67) + (1)), 0) AND (x_60 IS NULL) = (((x_67) + (1)) IS NULL)) AND
        (COALESCE(x_67, 0) = COALESCE(((x_73) + (1)), 0) AND (x_67 IS NULL) = (((x_73) + (1)) IS NULL)) AND
        (x_73 = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_80) + (1)) AS y,
  ((t_17_A_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_3_A_RecursiveCte AS t_17_A_RecursiveCte, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_80
WHERE
  (t_17_A_RecursiveCte.synalog_step < 21) AND
  (COALESCE(t_17_A_RecursiveCte.y, 0) = COALESCE(x_80, 0) AND (t_17_A_RecursiveCte.y IS NULL) = (x_80 IS NULL))),
t_2_A AS (SELECT
  A_RecursiveCte.y AS y
FROM
  t_3_A_RecursiveCte AS A_RecursiveCte
GROUP BY A_RecursiveCte.y),
t_20_B_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_101) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_101
      WHERE
        (0 < 22) AND
        (1 = 0) AND
        (x_101 = 0)
     UNION ALL
    
      SELECT
        ((x_117) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_117, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_123
      WHERE
        (((0) + (1)) < 22) AND
        (0 < 22) AND
        (1 = 0) AND
        (COALESCE(x_117, 0) = COALESCE(((x_123) + (1)), 0) AND (x_117 IS NULL) = (((x_123) + (1)) IS NULL)) AND
        (x_123 = 0)
     UNION ALL
    
      SELECT
        ((x_139) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_139, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_146, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_152
      WHERE
        (((((0) + (1))) + (1)) < 22) AND
        (((0) + (1)) < 22) AND
        (0 < 22) AND
        (1 = 0) AND
        (COALESCE(x_139, 0) = COALESCE(((x_146) + (1)), 0) AND (x_139 IS NULL) = (((x_146) + (1)) IS NULL)) AND
        (COALESCE(x_146, 0) = COALESCE(((x_152) + (1)), 0) AND (x_146 IS NULL) = (((x_152) + (1)) IS NULL)) AND
        (x_152 = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_159) + (1)) AS y,
  ((t_35_B_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_20_B_RecursiveCte AS t_35_B_RecursiveCte, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_159
WHERE
  (t_35_B_RecursiveCte.synalog_step < 22) AND
  (COALESCE(t_35_B_RecursiveCte.y, 0) = COALESCE(x_159, 0) AND (t_35_B_RecursiveCte.y IS NULL) = (x_159 IS NULL))),
t_19_B AS (SELECT
  B_RecursiveCte.y AS y
FROM
  t_20_B_RecursiveCte AS B_RecursiveCte
GROUP BY B_RecursiveCte.y)
SELECT
  MAX(t_0_A.y) AS a,
  MAX(t_1_B.y) AS b
FROM
  t_2_A AS t_0_A, t_19_B AS t_1_B;