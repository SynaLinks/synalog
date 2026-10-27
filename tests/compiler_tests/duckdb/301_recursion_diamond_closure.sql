-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_2_Edge AS (SELECT * FROM (
  
    SELECT
      's' AS a,
      'l' AS b
   UNION ALL
  
    SELECT
      's' AS a,
      'r' AS b
   UNION ALL
  
    SELECT
      'l' AS a,
      't' AS b
   UNION ALL
  
    SELECT
      'r' AS a,
      't' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Edge.a AS a,
        Edge.b AS b,
        0 AS synalog_step
      FROM
        t_2_Edge AS Edge
     UNION ALL
    
      SELECT
        t_5_Edge.a AS a,
        t_3_Edge.b AS b,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_5_Edge, t_2_Edge AS t_3_Edge
      WHERE
        (0 < 10) AND
        (1 = 0) AND
        (t_3_Edge.a IS NOT DISTINCT FROM t_5_Edge.b)
     UNION ALL
    
      SELECT
        t_11_Edge.a AS a,
        t_7_Edge.b AS b,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_11_Edge, t_2_Edge AS t_9_Edge, t_2_Edge AS t_7_Edge
      WHERE
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_7_Edge.a IS NOT DISTINCT FROM t_9_Edge.b) AND
        (t_9_Edge.a IS NOT DISTINCT FROM t_11_Edge.b)
     UNION ALL
    
      SELECT
        t_19_Edge.a AS a,
        t_13_Edge.b AS b,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_19_Edge, t_2_Edge AS t_17_Edge, t_2_Edge AS t_15_Edge, t_2_Edge AS t_13_Edge
      WHERE
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_13_Edge.a IS NOT DISTINCT FROM t_15_Edge.b) AND
        (t_15_Edge.a IS NOT DISTINCT FROM t_17_Edge.b) AND
        (t_17_Edge.a IS NOT DISTINCT FROM t_19_Edge.b)
     UNION ALL
    
      SELECT
        t_29_Edge.a AS a,
        t_21_Edge.b AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_29_Edge, t_2_Edge AS t_27_Edge, t_2_Edge AS t_25_Edge, t_2_Edge AS t_23_Edge, t_2_Edge AS t_21_Edge
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_21_Edge.a IS NOT DISTINCT FROM t_23_Edge.b) AND
        (t_23_Edge.a IS NOT DISTINCT FROM t_25_Edge.b) AND
        (t_25_Edge.a IS NOT DISTINCT FROM t_27_Edge.b) AND
        (t_27_Edge.a IS NOT DISTINCT FROM t_29_Edge.b)
     UNION ALL
    
      SELECT
        t_41_Edge.a AS a,
        t_31_Edge.b AS b,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_41_Edge, t_2_Edge AS t_39_Edge, t_2_Edge AS t_37_Edge, t_2_Edge AS t_35_Edge, t_2_Edge AS t_33_Edge, t_2_Edge AS t_31_Edge
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_31_Edge.a IS NOT DISTINCT FROM t_33_Edge.b) AND
        (t_33_Edge.a IS NOT DISTINCT FROM t_35_Edge.b) AND
        (t_35_Edge.a IS NOT DISTINCT FROM t_37_Edge.b) AND
        (t_37_Edge.a IS NOT DISTINCT FROM t_39_Edge.b) AND
        (t_39_Edge.a IS NOT DISTINCT FROM t_41_Edge.b)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_Reach_RecursiveCte.a AS a,
  t_43_Edge.b AS b,
  ((t_42_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_42_Reach_RecursiveCte, t_2_Edge AS t_43_Edge
WHERE
  (t_42_Reach_RecursiveCte.synalog_step < 10) AND
  (t_43_Edge.a IS NOT DISTINCT FROM t_42_Reach_RecursiveCte.b)),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.a AS a,
  Reach_RecursiveCte.b AS b
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.a, Reach_RecursiveCte.b)
SELECT
  SUM(1) AS n
FROM
  t_0_Reach AS Reach;