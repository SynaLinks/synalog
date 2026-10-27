WITH RECURSIVE t_2_Edge AS (SELECT * FROM (
  
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
t_1_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Edge.x AS x,
        Edge.y AS y,
        0 AS synalog_step
      FROM
        t_2_Edge AS Edge
     UNION ALL
    
      SELECT
        t_5_Edge.x AS x,
        t_3_Edge.y AS y,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_5_Edge, t_2_Edge AS t_3_Edge
      WHERE
        (0 < 10) AND
        (1 = 0) AND
        (t_3_Edge.x IS t_5_Edge.y)
     UNION ALL
    
      SELECT
        t_11_Edge.x AS x,
        t_7_Edge.y AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_11_Edge, t_2_Edge AS t_9_Edge, t_2_Edge AS t_7_Edge
      WHERE
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_7_Edge.x IS t_9_Edge.y) AND
        (t_9_Edge.x IS t_11_Edge.y)
     UNION ALL
    
      SELECT
        t_19_Edge.x AS x,
        t_13_Edge.y AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_19_Edge, t_2_Edge AS t_17_Edge, t_2_Edge AS t_15_Edge, t_2_Edge AS t_13_Edge
      WHERE
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_13_Edge.x IS t_15_Edge.y) AND
        (t_15_Edge.x IS t_17_Edge.y) AND
        (t_17_Edge.x IS t_19_Edge.y)
     UNION ALL
    
      SELECT
        t_29_Edge.x AS x,
        t_21_Edge.y AS y,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_29_Edge, t_2_Edge AS t_27_Edge, t_2_Edge AS t_25_Edge, t_2_Edge AS t_23_Edge, t_2_Edge AS t_21_Edge
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_21_Edge.x IS t_23_Edge.y) AND
        (t_23_Edge.x IS t_25_Edge.y) AND
        (t_25_Edge.x IS t_27_Edge.y) AND
        (t_27_Edge.x IS t_29_Edge.y)
     UNION ALL
    
      SELECT
        t_41_Edge.x AS x,
        t_31_Edge.y AS y,
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
        (t_31_Edge.x IS t_33_Edge.y) AND
        (t_33_Edge.x IS t_35_Edge.y) AND
        (t_35_Edge.x IS t_37_Edge.y) AND
        (t_37_Edge.x IS t_39_Edge.y) AND
        (t_39_Edge.x IS t_41_Edge.y)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_Reach_RecursiveCte.x AS x,
  t_43_Edge.y AS y,
  ((t_42_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_42_Reach_RecursiveCte, t_2_Edge AS t_43_Edge
WHERE
  (t_42_Reach_RecursiveCte.synalog_step < 10) AND
  (t_43_Edge.x IS t_42_Reach_RecursiveCte.y)),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.x AS x,
  Reach_RecursiveCte.y AS y
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.x, Reach_RecursiveCte.y)
SELECT
  SUM(1) AS n
FROM
  t_0_Reach AS Reach;