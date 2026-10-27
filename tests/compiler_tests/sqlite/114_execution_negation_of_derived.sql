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
        (t_5_Edge.x IS t_7_Edge.y) AND
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
        (t_10_Edge.x IS t_12_Edge.y) AND
        (t_12_Edge.x IS t_14_Edge.y) AND
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
        (t_17_Edge.x IS t_19_Edge.y) AND
        (t_19_Edge.x IS t_21_Edge.y) AND
        (t_21_Edge.x IS t_23_Edge.y) AND
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
        (t_26_Edge.x IS t_28_Edge.y) AND
        (t_28_Edge.x IS t_30_Edge.y) AND
        (t_30_Edge.x IS t_32_Edge.y) AND
        (t_32_Edge.x IS t_34_Edge.y) AND
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
  (t_37_Edge.x IS t_36_Reach_RecursiveCte.y)),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.x AS x,
  Reach_RecursiveCte.y AS y
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.x, Reach_RecursiveCte.y)
SELECT
  x_3.value AS n
FROM
  JSON_EACH(JSON_ARRAY('a', 'b', 'c', 'e')) as x_3
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_7.value)) AS synalog_value
  FROM
    t_0_Reach AS Reach, JSON_EACH(JSON_ARRAY(0)) as x_7
  WHERE
    (Reach.x = 'a') AND
    (Reach.y IS x_3.value)) IS NULL) ORDER BY n NULLS LAST;