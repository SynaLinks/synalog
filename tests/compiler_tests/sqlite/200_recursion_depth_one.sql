WITH RECURSIVE t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        1 AS x,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        Edge.b AS x,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Edge AS Edge
      WHERE
        (0 < 1) AND
        (1 = 0) AND
        (Edge.a = 1)
     UNION ALL
    
      SELECT
        t_4_Edge.b AS x,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_6_Edge, t_2_Edge AS t_4_Edge
      WHERE
        (((0) + (1)) < 1) AND
        (0 < 1) AND
        (1 = 0) AND
        (t_4_Edge.a IS t_6_Edge.b) AND
        (t_6_Edge.a = 1)
     UNION ALL
    
      SELECT
        t_9_Edge.b AS x,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_13_Edge, t_2_Edge AS t_11_Edge, t_2_Edge AS t_9_Edge
      WHERE
        (((((0) + (1))) + (1)) < 1) AND
        (((0) + (1)) < 1) AND
        (0 < 1) AND
        (1 = 0) AND
        (t_9_Edge.a IS t_11_Edge.b) AND
        (t_11_Edge.a IS t_13_Edge.b) AND
        (t_13_Edge.a = 1)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_16_Edge.b AS x,
  ((t_15_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_Reach_RecursiveCte AS t_15_Reach_RecursiveCte, t_2_Edge AS t_16_Edge
WHERE
  (t_15_Reach_RecursiveCte.synalog_step < 1) AND
  (t_16_Edge.a IS t_15_Reach_RecursiveCte.x))
SELECT
  Reach_RecursiveCte.x AS x
FROM
  t_0_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.x ORDER BY x NULLS LAST;