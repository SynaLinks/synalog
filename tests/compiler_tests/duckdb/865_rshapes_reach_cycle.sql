-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

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
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        1 AS x,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        E.b AS x,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_E AS E
      WHERE
        (0 < 8) AND
        (1 = 0) AND
        (E.a = 1)
     UNION ALL
    
      SELECT
        t_4_E.b AS x,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_6_E, t_2_E AS t_4_E
      WHERE
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_4_E.a IS NOT DISTINCT FROM t_6_E.b) AND
        (t_6_E.a = 1)
     UNION ALL
    
      SELECT
        t_9_E.b AS x,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_13_E, t_2_E AS t_11_E, t_2_E AS t_9_E
      WHERE
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_9_E.a IS NOT DISTINCT FROM t_11_E.b) AND
        (t_11_E.a IS NOT DISTINCT FROM t_13_E.b) AND
        (t_13_E.a = 1)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_16_E.b AS x,
  ((t_15_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_R_RecursiveCte AS t_15_R_RecursiveCte, t_2_E AS t_16_E
WHERE
  (t_15_R_RecursiveCte.synalog_step < 8) AND
  (t_16_E.a IS NOT DISTINCT FROM t_15_R_RecursiveCte.x))
SELECT
  R_RecursiveCte.x AS x
FROM
  t_0_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.x ORDER BY x;