-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_0_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS x,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_20) + (1)) AS x,
        ((0) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 3 - 1) as x), '{}')) as x_20
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (x_20 = 0)
     UNION ALL
    
      SELECT
        ((x_36) + (1)) AS x,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 3 - 1) as x), '{}')) as x_36, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 3 - 1) as x), '{}')) as x_42
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(x_36, 0) = COALESCE(((x_42) + (1)), 0) AND (x_36 IS NULL) = (((x_42) + (1)) IS NULL)) AND
        (x_42 = 0)
     UNION ALL
    
      SELECT
        ((x_58) + (1)) AS x,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 3 - 1) as x), '{}')) as x_58, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 3 - 1) as x), '{}')) as x_65, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 3 - 1) as x), '{}')) as x_71
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(x_58, 0) = COALESCE(((x_65) + (1)), 0) AND (x_58 IS NULL) = (((x_65) + (1)) IS NULL)) AND
        (COALESCE(x_65, 0) = COALESCE(((x_71) + (1)), 0) AND (x_65 IS NULL) = (((x_71) + (1)) IS NULL)) AND
        (x_71 = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_78) + (1)) AS x,
  ((t_14_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_R_RecursiveCte AS t_14_R_RecursiveCte, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 3 - 1) as x), '{}')) as x_78
WHERE
  (t_14_R_RecursiveCte.synalog_step < 5) AND
  (COALESCE(t_14_R_RecursiveCte.x, 0) = COALESCE(x_78, 0) AND (t_14_R_RecursiveCte.x IS NULL) = (x_78 IS NULL)))
SELECT
  R_RecursiveCte.x AS x
FROM
  t_0_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.x ORDER BY x;