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
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        E.a AS s,
        E.b AS t,
        0 AS synalog_step
      FROM
        t_2_E AS E
     UNION ALL
    
      SELECT
        t_5_E.a AS s,
        t_3_E.b AS t,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_E AS t_5_E, t_2_E AS t_3_E
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (t_3_E.a IS NOT DISTINCT FROM t_5_E.b)
     UNION ALL
    
      SELECT
        t_11_E.a AS s,
        t_7_E.b AS t,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_11_E, t_2_E AS t_9_E, t_2_E AS t_7_E
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_7_E.a IS NOT DISTINCT FROM t_9_E.b) AND
        (t_9_E.a IS NOT DISTINCT FROM t_11_E.b)
     UNION ALL
    
      SELECT
        t_19_E.a AS s,
        t_13_E.b AS t,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_19_E, t_2_E AS t_17_E, t_2_E AS t_15_E, t_2_E AS t_13_E
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_13_E.a IS NOT DISTINCT FROM t_15_E.b) AND
        (t_15_E.a IS NOT DISTINCT FROM t_17_E.b) AND
        (t_17_E.a IS NOT DISTINCT FROM t_19_E.b)
     UNION ALL
    
      SELECT
        t_29_E.a AS s,
        t_21_E.b AS t,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_29_E, t_2_E AS t_27_E, t_2_E AS t_25_E, t_2_E AS t_23_E, t_2_E AS t_21_E
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 5) AND
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_21_E.a IS NOT DISTINCT FROM t_23_E.b) AND
        (t_23_E.a IS NOT DISTINCT FROM t_25_E.b) AND
        (t_25_E.a IS NOT DISTINCT FROM t_27_E.b) AND
        (t_27_E.a IS NOT DISTINCT FROM t_29_E.b)
     UNION ALL
    
      SELECT
        t_41_E.a AS s,
        t_31_E.b AS t,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_41_E, t_2_E AS t_39_E, t_2_E AS t_37_E, t_2_E AS t_35_E, t_2_E AS t_33_E, t_2_E AS t_31_E
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 5) AND
        (((((((0) + (1))) + (1))) + (1)) < 5) AND
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_31_E.a IS NOT DISTINCT FROM t_33_E.b) AND
        (t_33_E.a IS NOT DISTINCT FROM t_35_E.b) AND
        (t_35_E.a IS NOT DISTINCT FROM t_37_E.b) AND
        (t_37_E.a IS NOT DISTINCT FROM t_39_E.b) AND
        (t_39_E.a IS NOT DISTINCT FROM t_41_E.b)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_Reach_RecursiveCte.s AS s,
  t_43_E.b AS t,
  ((t_42_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_42_Reach_RecursiveCte, t_2_E AS t_43_E
WHERE
  (t_42_Reach_RecursiveCte.synalog_step < 5) AND
  (t_43_E.a IS NOT DISTINCT FROM t_42_Reach_RecursiveCte.t)),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.s AS s,
  Reach_RecursiveCte.t AS t
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.s, Reach_RecursiveCte.t)
SELECT
  Reach.s AS s,
  SUM(1) AS n
FROM
  t_0_Reach AS Reach
GROUP BY Reach.s ORDER BY s;