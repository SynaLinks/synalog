-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      10 AS a,
      11 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        x_7 AS x,
        0 AS synalog_step
      FROM
        UNNEST(ARRAY[1, 10]) as x_7
     UNION ALL
    
      SELECT
        E.b AS x,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_E AS E, UNNEST(ARRAY[1, 10]) as x_22
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(E.a, 0) = COALESCE(x_22, 0) AND (E.a IS NULL) = (x_22 IS NULL))
     UNION ALL
    
      SELECT
        t_4_E.b AS x,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_6_E, t_2_E AS t_4_E, UNNEST(ARRAY[1, 10]) as x_42
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_4_E.a, 0) = COALESCE(t_6_E.b, 0) AND (t_4_E.a IS NULL) = (t_6_E.b IS NULL)) AND
        (COALESCE(t_6_E.a, 0) = COALESCE(x_42, 0) AND (t_6_E.a IS NULL) = (x_42 IS NULL))
     UNION ALL
    
      SELECT
        t_9_E.b AS x,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_13_E, t_2_E AS t_11_E, t_2_E AS t_9_E, UNNEST(ARRAY[1, 10]) as x_67
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_9_E.a, 0) = COALESCE(t_11_E.b, 0) AND (t_9_E.a IS NULL) = (t_11_E.b IS NULL)) AND
        (COALESCE(t_11_E.a, 0) = COALESCE(t_13_E.b, 0) AND (t_11_E.a IS NULL) = (t_13_E.b IS NULL)) AND
        (COALESCE(t_13_E.a, 0) = COALESCE(x_67, 0) AND (t_13_E.a IS NULL) = (x_67 IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_16_E.b AS x,
  ((t_15_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_R_RecursiveCte AS t_15_R_RecursiveCte, t_2_E AS t_16_E
WHERE
  (t_15_R_RecursiveCte.synalog_step < 5) AND
  (COALESCE(t_16_E.a, 0) = COALESCE(t_15_R_RecursiveCte.x, 0) AND (t_16_E.a IS NULL) = (t_15_R_RecursiveCte.x IS NULL)))
SELECT
  R_RecursiveCte.x AS x
FROM
  t_0_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.x ORDER BY x;