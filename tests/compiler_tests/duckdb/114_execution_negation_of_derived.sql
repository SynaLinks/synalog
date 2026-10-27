-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_3_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        'a' AS x,
        'a' AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        'a' AS x,
        Edge.y AS y,
        ((0) + (1)) AS synalog_step
      FROM
        t_3_Edge AS Edge
      WHERE
        (0 < 10) AND
        (1 = 0) AND
        (Edge.x = 'a')
     UNION ALL
    
      SELECT
        'a' AS x,
        t_5_Edge.y AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Edge AS t_7_Edge, t_3_Edge AS t_5_Edge
      WHERE
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_5_Edge.x IS NOT DISTINCT FROM t_7_Edge.y) AND
        (t_7_Edge.x = 'a')
     UNION ALL
    
      SELECT
        'a' AS x,
        t_10_Edge.y AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Edge AS t_14_Edge, t_3_Edge AS t_12_Edge, t_3_Edge AS t_10_Edge
      WHERE
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_10_Edge.x IS NOT DISTINCT FROM t_12_Edge.y) AND
        (t_12_Edge.x IS NOT DISTINCT FROM t_14_Edge.y) AND
        (t_14_Edge.x = 'a')
     UNION ALL
    
      SELECT
        'a' AS x,
        t_17_Edge.y AS y,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Edge AS t_23_Edge, t_3_Edge AS t_21_Edge, t_3_Edge AS t_19_Edge, t_3_Edge AS t_17_Edge
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_17_Edge.x IS NOT DISTINCT FROM t_19_Edge.y) AND
        (t_19_Edge.x IS NOT DISTINCT FROM t_21_Edge.y) AND
        (t_21_Edge.x IS NOT DISTINCT FROM t_23_Edge.y) AND
        (t_23_Edge.x = 'a')
     UNION ALL
    
      SELECT
        'a' AS x,
        t_26_Edge.y AS y,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Edge AS t_34_Edge, t_3_Edge AS t_32_Edge, t_3_Edge AS t_30_Edge, t_3_Edge AS t_28_Edge, t_3_Edge AS t_26_Edge
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_26_Edge.x IS NOT DISTINCT FROM t_28_Edge.y) AND
        (t_28_Edge.x IS NOT DISTINCT FROM t_30_Edge.y) AND
        (t_30_Edge.x IS NOT DISTINCT FROM t_32_Edge.y) AND
        (t_32_Edge.x IS NOT DISTINCT FROM t_34_Edge.y) AND
        (t_34_Edge.x = 'a')
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_36_Reach_RecursiveCte.x AS x,
  t_37_Edge.y AS y,
  ((t_36_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_36_Reach_RecursiveCte, t_3_Edge AS t_37_Edge
WHERE
  (t_36_Reach_RecursiveCte.synalog_step < 10) AND
  (t_37_Edge.x IS NOT DISTINCT FROM t_36_Reach_RecursiveCte.y)),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.x AS x,
  Reach_RecursiveCte.y AS y
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.x, Reach_RecursiveCte.y)
SELECT
  x_3.unnested_pod AS n
FROM
  (select unnest(['a', 'b', 'c', 'e']) as unnested_pod) as x_3
WHERE
  ((SELECT
    MIN((CASE WHEN x_7.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_0_Reach AS Reach, (select unnest([0]) as unnested_pod) as x_7
  WHERE
    (Reach.x = 'a') AND
    (Reach.y IS NOT DISTINCT FROM x_3.unnested_pod)) IS NULL) ORDER BY n;