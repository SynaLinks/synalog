WITH RECURSIVE t_1_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
   UNION ALL
  
    SELECT
      'c' AS x,
      'd' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Edge.x AS x,
        Edge.y AS y,
        0 AS synalog_step
      FROM
        t_1_Edge AS Edge
     UNION ALL
    
      SELECT
        t_4_Edge.x AS x,
        t_2_Edge.y AS y,
        ((0) + (1)) AS synalog_step
      FROM
        t_1_Edge AS t_4_Edge, t_1_Edge AS t_2_Edge
      WHERE
        (0 < 10) AND
        (1 = 0) AND
        (t_2_Edge.x IS t_4_Edge.y)
     UNION ALL
    
      SELECT
        t_10_Edge.x AS x,
        t_6_Edge.y AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Edge AS t_10_Edge, t_1_Edge AS t_8_Edge, t_1_Edge AS t_6_Edge
      WHERE
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_6_Edge.x IS t_8_Edge.y) AND
        (t_8_Edge.x IS t_10_Edge.y)
     UNION ALL
    
      SELECT
        t_18_Edge.x AS x,
        t_12_Edge.y AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Edge AS t_18_Edge, t_1_Edge AS t_16_Edge, t_1_Edge AS t_14_Edge, t_1_Edge AS t_12_Edge
      WHERE
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_12_Edge.x IS t_14_Edge.y) AND
        (t_14_Edge.x IS t_16_Edge.y) AND
        (t_16_Edge.x IS t_18_Edge.y)
     UNION ALL
    
      SELECT
        t_28_Edge.x AS x,
        t_20_Edge.y AS y,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Edge AS t_28_Edge, t_1_Edge AS t_26_Edge, t_1_Edge AS t_24_Edge, t_1_Edge AS t_22_Edge, t_1_Edge AS t_20_Edge
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_20_Edge.x IS t_22_Edge.y) AND
        (t_22_Edge.x IS t_24_Edge.y) AND
        (t_24_Edge.x IS t_26_Edge.y) AND
        (t_26_Edge.x IS t_28_Edge.y)
     UNION ALL
    
      SELECT
        t_40_Edge.x AS x,
        t_30_Edge.y AS y,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Edge AS t_40_Edge, t_1_Edge AS t_38_Edge, t_1_Edge AS t_36_Edge, t_1_Edge AS t_34_Edge, t_1_Edge AS t_32_Edge, t_1_Edge AS t_30_Edge
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_30_Edge.x IS t_32_Edge.y) AND
        (t_32_Edge.x IS t_34_Edge.y) AND
        (t_34_Edge.x IS t_36_Edge.y) AND
        (t_36_Edge.x IS t_38_Edge.y) AND
        (t_38_Edge.x IS t_40_Edge.y)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_41_Reach_RecursiveCte.x AS x,
  t_42_Edge.y AS y,
  ((t_41_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_Reach_RecursiveCte AS t_41_Reach_RecursiveCte, t_1_Edge AS t_42_Edge
WHERE
  (t_41_Reach_RecursiveCte.synalog_step < 10) AND
  (t_42_Edge.x IS t_41_Reach_RecursiveCte.y))
SELECT
  Reach_RecursiveCte.x AS x,
  Reach_RecursiveCte.y AS y
FROM
  t_0_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.x, Reach_RecursiveCte.y ORDER BY x NULLS LAST, y NULLS LAST;