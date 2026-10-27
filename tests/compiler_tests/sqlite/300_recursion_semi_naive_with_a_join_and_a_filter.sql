WITH RECURSIVE t_2_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS "from",
      'b' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'b' AS "from",
      'c' AS "to",
      true AS ok
   UNION ALL
  
    SELECT
      'c' AS "from",
      'd' AS "to",
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        'a' AS node,
        0 AS hops,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        Edge."to" AS node,
        ((0) + (1)) AS hops,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Edge AS Edge
      WHERE
        (0 < 50) AND
        (1 = 0) AND
        (Edge.ok = true) AND
        (Edge."from" = 'a')
     UNION ALL
    
      SELECT
        t_4_Edge."to" AS node,
        ((((0) + (1))) + (1)) AS hops,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_6_Edge, t_2_Edge AS t_4_Edge
      WHERE
        (((0) + (1)) < 50) AND
        (0 < 50) AND
        (1 = 0) AND
        (t_4_Edge.ok = true) AND
        (t_6_Edge.ok = true) AND
        (t_4_Edge."from" IS t_6_Edge."to") AND
        (t_6_Edge."from" = 'a')
     UNION ALL
    
      SELECT
        t_9_Edge."to" AS node,
        ((((((0) + (1))) + (1))) + (1)) AS hops,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_13_Edge, t_2_Edge AS t_11_Edge, t_2_Edge AS t_9_Edge
      WHERE
        (((((0) + (1))) + (1)) < 50) AND
        (((0) + (1)) < 50) AND
        (0 < 50) AND
        (1 = 0) AND
        (t_9_Edge.ok = true) AND
        (t_11_Edge.ok = true) AND
        (t_9_Edge."from" IS t_11_Edge."to") AND
        (t_13_Edge.ok = true) AND
        (t_11_Edge."from" IS t_13_Edge."to") AND
        (t_13_Edge."from" = 'a')
     UNION ALL
    
      SELECT
        t_16_Edge."to" AS node,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS hops,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_22_Edge, t_2_Edge AS t_20_Edge, t_2_Edge AS t_18_Edge, t_2_Edge AS t_16_Edge
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 50) AND
        (((((0) + (1))) + (1)) < 50) AND
        (((0) + (1)) < 50) AND
        (0 < 50) AND
        (1 = 0) AND
        (t_16_Edge.ok = true) AND
        (t_18_Edge.ok = true) AND
        (t_16_Edge."from" IS t_18_Edge."to") AND
        (t_20_Edge.ok = true) AND
        (t_18_Edge."from" IS t_20_Edge."to") AND
        (t_22_Edge.ok = true) AND
        (t_20_Edge."from" IS t_22_Edge."to") AND
        (t_22_Edge."from" = 'a')
     UNION ALL
    
      SELECT
        t_25_Edge."to" AS node,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS hops,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_33_Edge, t_2_Edge AS t_31_Edge, t_2_Edge AS t_29_Edge, t_2_Edge AS t_27_Edge, t_2_Edge AS t_25_Edge
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 50) AND
        (((((((0) + (1))) + (1))) + (1)) < 50) AND
        (((((0) + (1))) + (1)) < 50) AND
        (((0) + (1)) < 50) AND
        (0 < 50) AND
        (1 = 0) AND
        (t_25_Edge.ok = true) AND
        (t_27_Edge.ok = true) AND
        (t_25_Edge."from" IS t_27_Edge."to") AND
        (t_29_Edge.ok = true) AND
        (t_27_Edge."from" IS t_29_Edge."to") AND
        (t_31_Edge.ok = true) AND
        (t_29_Edge."from" IS t_31_Edge."to") AND
        (t_33_Edge.ok = true) AND
        (t_31_Edge."from" IS t_33_Edge."to") AND
        (t_33_Edge."from" = 'a')
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_36_Edge."to" AS node,
  ((t_35_Reach_RecursiveCte.hops) + (1)) AS hops,
  ((t_35_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_Reach_RecursiveCte AS t_35_Reach_RecursiveCte, t_2_Edge AS t_36_Edge
WHERE
  (t_35_Reach_RecursiveCte.synalog_step < 50) AND
  (t_36_Edge."from" IS t_35_Reach_RecursiveCte.node) AND
  (t_36_Edge.ok = true))
SELECT
  Reach_RecursiveCte.node AS node,
  Reach_RecursiveCte.hops AS hops
FROM
  t_0_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.node, Reach_RecursiveCte.hops ORDER BY node NULLS LAST;