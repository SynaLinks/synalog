-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_4_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_2_Select_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        1 AS x,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        Edge.b AS x,
        ((0) + (1)) AS synalog_step
      FROM
        t_4_Edge AS Edge
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (Edge.a = 1)
     UNION ALL
    
      SELECT
        t_6_Edge.b AS x,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_4_Edge AS t_8_Edge, t_4_Edge AS t_6_Edge
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_6_Edge.a IS NOT DISTINCT FROM t_8_Edge.b) AND
        (t_8_Edge.a = 1)
     UNION ALL
    
      SELECT
        t_11_Edge.b AS x,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_4_Edge AS t_15_Edge, t_4_Edge AS t_13_Edge, t_4_Edge AS t_11_Edge
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_11_Edge.a IS NOT DISTINCT FROM t_13_Edge.b) AND
        (t_13_Edge.a IS NOT DISTINCT FROM t_15_Edge.b) AND
        (t_15_Edge.a = 1)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_18_Edge.b AS x,
  ((t_17_Select_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_2_Select_RecursiveCte AS t_17_Select_RecursiveCte, t_4_Edge AS t_18_Edge
WHERE
  (t_17_Select_RecursiveCte.synalog_step < 5) AND
  (t_18_Edge.a IS NOT DISTINCT FROM t_17_Select_RecursiveCte.x)),
t_1_Select AS (SELECT
  Select_RecursiveCte.x AS x
FROM
  t_2_Select_RecursiveCte AS Select_RecursiveCte
GROUP BY Select_RecursiveCte.x)
SELECT
  SUM(1) AS n
FROM
  t_1_Select AS t_0_Select;