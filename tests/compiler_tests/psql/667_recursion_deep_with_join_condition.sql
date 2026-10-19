-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_3_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS logica_step
     UNION ALL
    
      SELECT
        ((x_23) + (2)) AS y,
        ((0) + (1)) AS logica_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_23
      WHERE
        (((x_23) + (2)) < 25) AND
        (0 < 30) AND
        (1 = 0) AND
        (x_23 = 0)
     UNION ALL
    
      SELECT
        ((x_39) + (2)) AS y,
        ((((0) + (1))) + (1)) AS logica_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_39, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_45
      WHERE
        (((x_39) + (2)) < 25) AND
        (((0) + (1)) < 30) AND
        (((x_45) + (2)) < 25) AND
        (0 < 30) AND
        (1 = 0) AND
        (x_39 = ((x_45) + (2))) AND
        (x_45 = 0)
     UNION ALL
    
      SELECT
        ((x_61) + (2)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS logica_step
      FROM
        UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_61, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_68, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_74
      WHERE
        (((x_61) + (2)) < 25) AND
        (((((0) + (1))) + (1)) < 30) AND
        (((x_68) + (2)) < 25) AND
        (((0) + (1)) < 30) AND
        (((x_74) + (2)) < 25) AND
        (0 < 30) AND
        (1 = 0) AND
        (x_61 = ((x_68) + (2))) AND
        (x_68 = ((x_74) + (2))) AND
        (x_74 = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_81) + (2)) AS y,
  ((t_17_R_RecursiveCte.logica_step) + (1)) AS logica_step
FROM
  t_3_R_RecursiveCte AS t_17_R_RecursiveCte, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 100 - 1) as x), '{}')) as x_81
WHERE
  (((x_81) + (2)) < 25) AND
  (t_17_R_RecursiveCte.logica_step < 30) AND
  (t_17_R_RecursiveCte.y = x_81)),
t_2_R AS (SELECT
  R_RecursiveCte.y AS y
FROM
  t_3_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.y),
t_1_M AS (SELECT
  MAX(R.y) AS m
FROM
  t_2_R AS R)
SELECT
  t_0_M.m AS m
FROM
  t_1_M AS t_0_M ORDER BY m;