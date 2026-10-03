WITH t_29_Dist_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
  
) AS UNUSED_TABLE_NAME  ),
t_28_Dist_r0 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f1.node AS node,
  MIN(Dist_MultBodyAggAux_recursive_head_f1.d) AS d
FROM
  t_29_Dist_MultBodyAggAux_recursive_head_f1 AS Dist_MultBodyAggAux_recursive_head_f1
GROUP BY Dist_MultBodyAggAux_recursive_head_f1.node ORDER BY node),
t_31_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
   UNION ALL
  
    SELECT
      'a' AS x,
      'd' AS y
   UNION ALL
  
    SELECT
      'd' AS x,
      'c' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_26_Dist_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      t_27_Edge.y AS node,
      ((Dist_r0.d) + (1)) AS d
    FROM
      t_28_Dist_r0 AS Dist_r0, t_31_Edge AS t_27_Edge
    WHERE
      (t_27_Edge.x = Dist_r0.node)
  
) AS UNUSED_TABLE_NAME  ),
t_25_Dist_r1 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f2.node AS node,
  MIN(Dist_MultBodyAggAux_recursive_head_f2.d) AS d
FROM
  t_26_Dist_MultBodyAggAux_recursive_head_f2 AS Dist_MultBodyAggAux_recursive_head_f2
GROUP BY Dist_MultBodyAggAux_recursive_head_f2.node ORDER BY node),
t_23_Dist_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      t_24_Edge.y AS node,
      ((Dist_r1.d) + (1)) AS d
    FROM
      t_25_Dist_r1 AS Dist_r1, t_31_Edge AS t_24_Edge
    WHERE
      (t_24_Edge.x = Dist_r1.node)
  
) AS UNUSED_TABLE_NAME  ),
t_22_Dist_r2 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f3.node AS node,
  MIN(Dist_MultBodyAggAux_recursive_head_f3.d) AS d
FROM
  t_23_Dist_MultBodyAggAux_recursive_head_f3 AS Dist_MultBodyAggAux_recursive_head_f3
GROUP BY Dist_MultBodyAggAux_recursive_head_f3.node ORDER BY node),
t_20_Dist_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      t_21_Edge.y AS node,
      ((Dist_r2.d) + (1)) AS d
    FROM
      t_22_Dist_r2 AS Dist_r2, t_31_Edge AS t_21_Edge
    WHERE
      (t_21_Edge.x = Dist_r2.node)
  
) AS UNUSED_TABLE_NAME  ),
t_19_Dist_r3 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f4.node AS node,
  MIN(Dist_MultBodyAggAux_recursive_head_f4.d) AS d
FROM
  t_20_Dist_MultBodyAggAux_recursive_head_f4 AS Dist_MultBodyAggAux_recursive_head_f4
GROUP BY Dist_MultBodyAggAux_recursive_head_f4.node ORDER BY node),
t_17_Dist_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      t_18_Edge.y AS node,
      ((Dist_r3.d) + (1)) AS d
    FROM
      t_19_Dist_r3 AS Dist_r3, t_31_Edge AS t_18_Edge
    WHERE
      (t_18_Edge.x = Dist_r3.node)
  
) AS UNUSED_TABLE_NAME  ),
t_16_Dist_r4 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f5.node AS node,
  MIN(Dist_MultBodyAggAux_recursive_head_f5.d) AS d
FROM
  t_17_Dist_MultBodyAggAux_recursive_head_f5 AS Dist_MultBodyAggAux_recursive_head_f5
GROUP BY Dist_MultBodyAggAux_recursive_head_f5.node ORDER BY node),
t_14_Dist_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      t_15_Edge.y AS node,
      ((Dist_r4.d) + (1)) AS d
    FROM
      t_16_Dist_r4 AS Dist_r4, t_31_Edge AS t_15_Edge
    WHERE
      (t_15_Edge.x = Dist_r4.node)
  
) AS UNUSED_TABLE_NAME  ),
t_13_Dist_r5 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f6.node AS node,
  MIN(Dist_MultBodyAggAux_recursive_head_f6.d) AS d
FROM
  t_14_Dist_MultBodyAggAux_recursive_head_f6 AS Dist_MultBodyAggAux_recursive_head_f6
GROUP BY Dist_MultBodyAggAux_recursive_head_f6.node ORDER BY node),
t_11_Dist_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      t_12_Edge.y AS node,
      ((Dist_r5.d) + (1)) AS d
    FROM
      t_13_Dist_r5 AS Dist_r5, t_31_Edge AS t_12_Edge
    WHERE
      (t_12_Edge.x = Dist_r5.node)
  
) AS UNUSED_TABLE_NAME  ),
t_10_Dist_r6 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f7.node AS node,
  MIN(Dist_MultBodyAggAux_recursive_head_f7.d) AS d
FROM
  t_11_Dist_MultBodyAggAux_recursive_head_f7 AS Dist_MultBodyAggAux_recursive_head_f7
GROUP BY Dist_MultBodyAggAux_recursive_head_f7.node ORDER BY node),
t_8_Dist_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      t_9_Edge.y AS node,
      ((Dist_r6.d) + (1)) AS d
    FROM
      t_10_Dist_r6 AS Dist_r6, t_31_Edge AS t_9_Edge
    WHERE
      (t_9_Edge.x = Dist_r6.node)
  
) AS UNUSED_TABLE_NAME  ),
t_7_Dist_r7 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f8.node AS node,
  MIN(Dist_MultBodyAggAux_recursive_head_f8.d) AS d
FROM
  t_8_Dist_MultBodyAggAux_recursive_head_f8 AS Dist_MultBodyAggAux_recursive_head_f8
GROUP BY Dist_MultBodyAggAux_recursive_head_f8.node ORDER BY node),
t_5_Dist_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      t_6_Edge.y AS node,
      ((Dist_r7.d) + (1)) AS d
    FROM
      t_7_Dist_r7 AS Dist_r7, t_31_Edge AS t_6_Edge
    WHERE
      (t_6_Edge.x = Dist_r7.node)
  
) AS UNUSED_TABLE_NAME  ),
t_4_Dist_r8 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f9.node AS node,
  MIN(Dist_MultBodyAggAux_recursive_head_f9.d) AS d
FROM
  t_5_Dist_MultBodyAggAux_recursive_head_f9 AS Dist_MultBodyAggAux_recursive_head_f9
GROUP BY Dist_MultBodyAggAux_recursive_head_f9.node ORDER BY node),
t_2_Dist_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      t_3_Edge.y AS node,
      ((Dist_r8.d) + (1)) AS d
    FROM
      t_4_Dist_r8 AS Dist_r8, t_31_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.x = Dist_r8.node)
  
) AS UNUSED_TABLE_NAME  ),
t_1_Dist_r9 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f10.node AS node,
  MIN(Dist_MultBodyAggAux_recursive_head_f10.d) AS d
FROM
  t_2_Dist_MultBodyAggAux_recursive_head_f10 AS Dist_MultBodyAggAux_recursive_head_f10
GROUP BY Dist_MultBodyAggAux_recursive_head_f10.node ORDER BY node),
t_0_Dist_MultBodyAggAux_recursive_head_f11 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.y AS node,
      ((Dist_r9.d) + (1)) AS d
    FROM
      t_1_Dist_r9 AS Dist_r9, t_31_Edge AS Edge
    WHERE
      (Edge.x = Dist_r9.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_recursive_head_f11.node AS node,
  MIN(Dist_MultBodyAggAux_recursive_head_f11.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_recursive_head_f11 AS Dist_MultBodyAggAux_recursive_head_f11
GROUP BY Dist_MultBodyAggAux_recursive_head_f11.node ORDER BY node;