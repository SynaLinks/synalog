WITH RECURSIVE t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        1 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        Edge.y AS y,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Edge AS Edge
      WHERE
        (0 < 20) AND
        (1 = 0) AND
        (Edge.x = 1)
     UNION ALL
    
      SELECT
        t_4_Edge.y AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_6_Edge, t_2_Edge AS t_4_Edge
      WHERE
        (((0) + (1)) < 20) AND
        (0 < 20) AND
        (1 = 0) AND
        (t_4_Edge.x IS t_6_Edge.y) AND
        (t_6_Edge.x = 1)
     UNION ALL
    
      SELECT
        t_9_Edge.y AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_13_Edge, t_2_Edge AS t_11_Edge, t_2_Edge AS t_9_Edge
      WHERE
        (((((0) + (1))) + (1)) < 20) AND
        (((0) + (1)) < 20) AND
        (0 < 20) AND
        (1 = 0) AND
        (t_9_Edge.x IS t_11_Edge.y) AND
        (t_11_Edge.x IS t_13_Edge.y) AND
        (t_13_Edge.x = 1)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_16_Edge.y AS y,
  ((t_15_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_Reach_RecursiveCte AS t_15_Reach_RecursiveCte, t_2_Edge AS t_16_Edge
WHERE
  (t_15_Reach_RecursiveCte.synalog_step < 20) AND
  (t_16_Edge.x IS t_15_Reach_RecursiveCte.y))
SELECT
  Reach_RecursiveCte.y AS y
FROM
  t_0_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.y ORDER BY y NULLS LAST;