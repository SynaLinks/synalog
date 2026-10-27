-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_0_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y
     UNION ALL
    
      SELECT
        ((x_13) + (1)) AS y
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_13
      WHERE
        (1 = 0) AND
        (x_13 = 0)
     UNION ALL
    
      SELECT
        ((x_25) + (1)) AS y
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_25, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_29
      WHERE
        (1 = 0) AND
        (COALESCE(x_25, 0) = COALESCE(((x_29) + (1)), 0) AND (x_25 IS NULL) = (((x_29) + (1)) IS NULL)) AND
        (x_29 = 0)
     UNION ALL
    
      SELECT
        ((x_41) + (1)) AS y
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_41, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_47, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_51
      WHERE
        (1 = 0) AND
        (COALESCE(x_41, 0) = COALESCE(((x_47) + (1)), 0) AND (x_41 IS NULL) = (((x_47) + (1)) IS NULL)) AND
        (COALESCE(x_47, 0) = COALESCE(((x_51) + (1)), 0) AND (x_47 IS NULL) = (((x_51) + (1)) IS NULL)) AND
        (x_51 = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_57) + (1)) AS y
FROM
  t_0_Reach_RecursiveCte AS t_14_Reach_RecursiveCte, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_57
WHERE
  (COALESCE(t_14_Reach_RecursiveCte.y, 0) = COALESCE(x_57, 0) AND (t_14_Reach_RecursiveCte.y IS NULL) = (x_57 IS NULL)))
SELECT
  Reach_RecursiveCte.y AS y
FROM
  t_0_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.y ORDER BY y;