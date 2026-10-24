-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_0_Test_RecursiveCte AS (SELECT * FROM (
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
        (x_25 = ((x_29) + (1))) AND
        (x_29 = 0)
     UNION ALL
    
      SELECT
        ((x_41) + (1)) AS y
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_41, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_47, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_51
      WHERE
        (1 = 0) AND
        (x_41 = ((x_47) + (1))) AND
        (x_47 = ((x_51) + (1))) AND
        (x_51 = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_57) + (1)) AS y
FROM
  t_0_Test_RecursiveCte AS t_14_Test_RecursiveCte, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_57
WHERE
  (t_14_Test_RecursiveCte.y = x_57))
SELECT
  Test_RecursiveCte.y AS y
FROM
  t_0_Test_RecursiveCte AS Test_RecursiveCte
GROUP BY Test_RecursiveCte.y;