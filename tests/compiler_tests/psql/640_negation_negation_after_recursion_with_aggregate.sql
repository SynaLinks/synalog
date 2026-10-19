-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_1_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        1 AS x,
        0 AS logica_step
     UNION ALL
    
      SELECT
        2 AS x,
        ((0) + (1)) AS logica_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (0 < 5) AND
        (1 = 0)
     UNION ALL
    
      SELECT
        2 AS x,
        ((((0) + (1))) + (1)) AS logica_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (1 = 2)
     UNION ALL
    
      SELECT
        2 AS x,
        ((((((0) + (1))) + (1))) + (1)) AS logica_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (1 = 2)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  2 AS x,
  ((t_15_R_RecursiveCte.logica_step) + (1)) AS logica_step
FROM
  t_1_R_RecursiveCte AS t_15_R_RecursiveCte
WHERE
  (t_15_R_RecursiveCte.logica_step < 5) AND
  (t_15_R_RecursiveCte.x = 1)),
t_0_R AS (SELECT
  R_RecursiveCte.x AS x
FROM
  t_1_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.x)
SELECT
  SUM(1) AS n
FROM
  UNNEST(ARRAY[1, 2, 3, 4]) as x_2
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_5 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_0_R AS R, UNNEST(ARRAY[0]) as x_5
  WHERE
    (R.x = x_2)) AS numeric) IS NULL);