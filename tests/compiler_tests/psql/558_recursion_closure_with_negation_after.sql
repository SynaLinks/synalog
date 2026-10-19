-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        1 AS x,
        0 AS logica_step
     UNION ALL
    
      SELECT
        E.b AS x,
        ((0) + (1)) AS logica_step
      FROM
        t_3_E AS E
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (E.a = 1)
     UNION ALL
    
      SELECT
        t_5_E.b AS x,
        ((((0) + (1))) + (1)) AS logica_step
      FROM
        t_3_E AS t_7_E, t_3_E AS t_5_E
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_5_E.a = t_7_E.b) AND
        (t_7_E.a = 1)
     UNION ALL
    
      SELECT
        t_10_E.b AS x,
        ((((((0) + (1))) + (1))) + (1)) AS logica_step
      FROM
        t_3_E AS t_14_E, t_3_E AS t_12_E, t_3_E AS t_10_E
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_10_E.a = t_12_E.b) AND
        (t_12_E.a = t_14_E.b) AND
        (t_14_E.a = 1)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_17_E.b AS x,
  ((t_16_R_RecursiveCte.logica_step) + (1)) AS logica_step
FROM
  t_1_R_RecursiveCte AS t_16_R_RecursiveCte, t_3_E AS t_17_E
WHERE
  (t_16_R_RecursiveCte.logica_step < 5) AND
  (t_17_E.a = t_16_R_RecursiveCte.x)),
t_0_R AS (SELECT
  R_RecursiveCte.x AS x
FROM
  t_1_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.x)
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 5]) as x_3
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_0_R AS R, UNNEST(ARRAY[0]) as x_6
  WHERE
    (R.x = x_3)) AS numeric) IS NULL);