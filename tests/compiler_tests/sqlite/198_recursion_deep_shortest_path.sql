WITH RECURSIVE t_3_Edge AS (SELECT * FROM (
  
    SELECT
      0 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      0 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Hop_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS node,
        0 AS d,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        Edge.b AS node,
        ((0) + (1)) AS d,
        ((0) + (1)) AS synalog_step
      FROM
        t_3_Edge AS Edge
      WHERE
        (0 < 5) AND
        (0 < 25) AND
        (1 = 0) AND
        (Edge.a = 0)
     UNION ALL
    
      SELECT
        t_5_Edge.b AS node,
        ((((0) + (1))) + (1)) AS d,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Edge AS t_7_Edge, t_3_Edge AS t_5_Edge
      WHERE
        (((0) + (1)) < 5) AND
        (((0) + (1)) < 25) AND
        (0 < 5) AND
        (0 < 25) AND
        (1 = 0) AND
        (t_5_Edge.a IS t_7_Edge.b) AND
        (t_7_Edge.a = 0)
     UNION ALL
    
      SELECT
        t_10_Edge.b AS node,
        ((((((0) + (1))) + (1))) + (1)) AS d,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Edge AS t_14_Edge, t_3_Edge AS t_12_Edge, t_3_Edge AS t_10_Edge
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((((0) + (1))) + (1)) < 25) AND
        (((0) + (1)) < 5) AND
        (((0) + (1)) < 25) AND
        (0 < 5) AND
        (0 < 25) AND
        (1 = 0) AND
        (t_10_Edge.a IS t_12_Edge.b) AND
        (t_12_Edge.a IS t_14_Edge.b) AND
        (t_14_Edge.a = 0)
     UNION ALL
    
      SELECT
        t_17_Edge.b AS node,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS d,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Edge AS t_23_Edge, t_3_Edge AS t_21_Edge, t_3_Edge AS t_19_Edge, t_3_Edge AS t_17_Edge
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 5) AND
        (((((((0) + (1))) + (1))) + (1)) < 25) AND
        (((((0) + (1))) + (1)) < 5) AND
        (((((0) + (1))) + (1)) < 25) AND
        (((0) + (1)) < 5) AND
        (((0) + (1)) < 25) AND
        (0 < 5) AND
        (0 < 25) AND
        (1 = 0) AND
        (t_17_Edge.a IS t_19_Edge.b) AND
        (t_19_Edge.a IS t_21_Edge.b) AND
        (t_21_Edge.a IS t_23_Edge.b) AND
        (t_23_Edge.a = 0)
     UNION ALL
    
      SELECT
        t_26_Edge.b AS node,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS d,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Edge AS t_34_Edge, t_3_Edge AS t_32_Edge, t_3_Edge AS t_30_Edge, t_3_Edge AS t_28_Edge, t_3_Edge AS t_26_Edge
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 5) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 25) AND
        (((((((0) + (1))) + (1))) + (1)) < 5) AND
        (((((((0) + (1))) + (1))) + (1)) < 25) AND
        (((((0) + (1))) + (1)) < 5) AND
        (((((0) + (1))) + (1)) < 25) AND
        (((0) + (1)) < 5) AND
        (((0) + (1)) < 25) AND
        (0 < 5) AND
        (0 < 25) AND
        (1 = 0) AND
        (t_26_Edge.a IS t_28_Edge.b) AND
        (t_28_Edge.a IS t_30_Edge.b) AND
        (t_30_Edge.a IS t_32_Edge.b) AND
        (t_32_Edge.a IS t_34_Edge.b) AND
        (t_34_Edge.a = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_37_Edge.b AS node,
  ((t_36_Hop_RecursiveCte.d) + (1)) AS d,
  ((t_36_Hop_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Hop_RecursiveCte AS t_36_Hop_RecursiveCte, t_3_Edge AS t_37_Edge
WHERE
  (t_36_Hop_RecursiveCte.d < 5) AND
  (t_36_Hop_RecursiveCte.synalog_step < 25) AND
  (t_37_Edge.a IS t_36_Hop_RecursiveCte.node)),
t_0_Hop AS (SELECT
  Hop_RecursiveCte.node AS node,
  Hop_RecursiveCte.d AS d
FROM
  t_1_Hop_RecursiveCte AS Hop_RecursiveCte
GROUP BY Hop_RecursiveCte.node, Hop_RecursiveCte.d)
SELECT
  Hop.node AS node,
  MIN(Hop.d) AS d
FROM
  t_0_Hop AS Hop
GROUP BY Hop.node ORDER BY node NULLS LAST;