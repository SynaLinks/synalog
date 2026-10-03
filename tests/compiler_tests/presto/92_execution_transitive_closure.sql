WITH t_1_Edge AS (SELECT * FROM (
  
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
t_40_Reach_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_41_Edge.x AS x,
      t_41_Edge.y AS y
    FROM
      t_1_Edge AS t_41_Edge
  
) AS UNUSED_TABLE_NAME  ),
t_39_Reach_r0 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f1.x AS x,
  Reach_MultBodyAggAux_recursive_head_f1.y AS y
FROM
  t_40_Reach_MultBodyAggAux_recursive_head_f1 AS Reach_MultBodyAggAux_recursive_head_f1
GROUP BY 1, 2 ORDER BY x, y),
t_36_Reach_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_37_Edge.x AS x,
      t_37_Edge.y AS y
    FROM
      t_1_Edge AS t_37_Edge
   UNION ALL
  
    SELECT
      Reach_r0.x AS x,
      t_38_Edge.y AS y
    FROM
      t_39_Reach_r0 AS Reach_r0, t_1_Edge AS t_38_Edge
    WHERE
      (t_38_Edge.x = Reach_r0.y)
  
) AS UNUSED_TABLE_NAME  ),
t_35_Reach_r1 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f2.x AS x,
  Reach_MultBodyAggAux_recursive_head_f2.y AS y
FROM
  t_36_Reach_MultBodyAggAux_recursive_head_f2 AS Reach_MultBodyAggAux_recursive_head_f2
GROUP BY 1, 2 ORDER BY x, y),
t_32_Reach_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_33_Edge.x AS x,
      t_33_Edge.y AS y
    FROM
      t_1_Edge AS t_33_Edge
   UNION ALL
  
    SELECT
      Reach_r1.x AS x,
      t_34_Edge.y AS y
    FROM
      t_35_Reach_r1 AS Reach_r1, t_1_Edge AS t_34_Edge
    WHERE
      (t_34_Edge.x = Reach_r1.y)
  
) AS UNUSED_TABLE_NAME  ),
t_31_Reach_r2 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f3.x AS x,
  Reach_MultBodyAggAux_recursive_head_f3.y AS y
FROM
  t_32_Reach_MultBodyAggAux_recursive_head_f3 AS Reach_MultBodyAggAux_recursive_head_f3
GROUP BY 1, 2 ORDER BY x, y),
t_28_Reach_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_29_Edge.x AS x,
      t_29_Edge.y AS y
    FROM
      t_1_Edge AS t_29_Edge
   UNION ALL
  
    SELECT
      Reach_r2.x AS x,
      t_30_Edge.y AS y
    FROM
      t_31_Reach_r2 AS Reach_r2, t_1_Edge AS t_30_Edge
    WHERE
      (t_30_Edge.x = Reach_r2.y)
  
) AS UNUSED_TABLE_NAME  ),
t_27_Reach_r3 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f4.x AS x,
  Reach_MultBodyAggAux_recursive_head_f4.y AS y
FROM
  t_28_Reach_MultBodyAggAux_recursive_head_f4 AS Reach_MultBodyAggAux_recursive_head_f4
GROUP BY 1, 2 ORDER BY x, y),
t_24_Reach_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_25_Edge.x AS x,
      t_25_Edge.y AS y
    FROM
      t_1_Edge AS t_25_Edge
   UNION ALL
  
    SELECT
      Reach_r3.x AS x,
      t_26_Edge.y AS y
    FROM
      t_27_Reach_r3 AS Reach_r3, t_1_Edge AS t_26_Edge
    WHERE
      (t_26_Edge.x = Reach_r3.y)
  
) AS UNUSED_TABLE_NAME  ),
t_23_Reach_r4 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f5.x AS x,
  Reach_MultBodyAggAux_recursive_head_f5.y AS y
FROM
  t_24_Reach_MultBodyAggAux_recursive_head_f5 AS Reach_MultBodyAggAux_recursive_head_f5
GROUP BY 1, 2 ORDER BY x, y),
t_20_Reach_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_21_Edge.x AS x,
      t_21_Edge.y AS y
    FROM
      t_1_Edge AS t_21_Edge
   UNION ALL
  
    SELECT
      Reach_r4.x AS x,
      t_22_Edge.y AS y
    FROM
      t_23_Reach_r4 AS Reach_r4, t_1_Edge AS t_22_Edge
    WHERE
      (t_22_Edge.x = Reach_r4.y)
  
) AS UNUSED_TABLE_NAME  ),
t_19_Reach_r5 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f6.x AS x,
  Reach_MultBodyAggAux_recursive_head_f6.y AS y
FROM
  t_20_Reach_MultBodyAggAux_recursive_head_f6 AS Reach_MultBodyAggAux_recursive_head_f6
GROUP BY 1, 2 ORDER BY x, y),
t_16_Reach_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_17_Edge.x AS x,
      t_17_Edge.y AS y
    FROM
      t_1_Edge AS t_17_Edge
   UNION ALL
  
    SELECT
      Reach_r5.x AS x,
      t_18_Edge.y AS y
    FROM
      t_19_Reach_r5 AS Reach_r5, t_1_Edge AS t_18_Edge
    WHERE
      (t_18_Edge.x = Reach_r5.y)
  
) AS UNUSED_TABLE_NAME  ),
t_15_Reach_r6 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f7.x AS x,
  Reach_MultBodyAggAux_recursive_head_f7.y AS y
FROM
  t_16_Reach_MultBodyAggAux_recursive_head_f7 AS Reach_MultBodyAggAux_recursive_head_f7
GROUP BY 1, 2 ORDER BY x, y),
t_12_Reach_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_13_Edge.x AS x,
      t_13_Edge.y AS y
    FROM
      t_1_Edge AS t_13_Edge
   UNION ALL
  
    SELECT
      Reach_r6.x AS x,
      t_14_Edge.y AS y
    FROM
      t_15_Reach_r6 AS Reach_r6, t_1_Edge AS t_14_Edge
    WHERE
      (t_14_Edge.x = Reach_r6.y)
  
) AS UNUSED_TABLE_NAME  ),
t_11_Reach_r7 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f8.x AS x,
  Reach_MultBodyAggAux_recursive_head_f8.y AS y
FROM
  t_12_Reach_MultBodyAggAux_recursive_head_f8 AS Reach_MultBodyAggAux_recursive_head_f8
GROUP BY 1, 2 ORDER BY x, y),
t_8_Reach_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      t_9_Edge.x AS x,
      t_9_Edge.y AS y
    FROM
      t_1_Edge AS t_9_Edge
   UNION ALL
  
    SELECT
      Reach_r7.x AS x,
      t_10_Edge.y AS y
    FROM
      t_11_Reach_r7 AS Reach_r7, t_1_Edge AS t_10_Edge
    WHERE
      (t_10_Edge.x = Reach_r7.y)
  
) AS UNUSED_TABLE_NAME  ),
t_7_Reach_r8 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f9.x AS x,
  Reach_MultBodyAggAux_recursive_head_f9.y AS y
FROM
  t_8_Reach_MultBodyAggAux_recursive_head_f9 AS Reach_MultBodyAggAux_recursive_head_f9
GROUP BY 1, 2 ORDER BY x, y),
t_4_Reach_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      t_5_Edge.x AS x,
      t_5_Edge.y AS y
    FROM
      t_1_Edge AS t_5_Edge
   UNION ALL
  
    SELECT
      Reach_r8.x AS x,
      t_6_Edge.y AS y
    FROM
      t_7_Reach_r8 AS Reach_r8, t_1_Edge AS t_6_Edge
    WHERE
      (t_6_Edge.x = Reach_r8.y)
  
) AS UNUSED_TABLE_NAME  ),
t_3_Reach_r9 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f10.x AS x,
  Reach_MultBodyAggAux_recursive_head_f10.y AS y
FROM
  t_4_Reach_MultBodyAggAux_recursive_head_f10 AS Reach_MultBodyAggAux_recursive_head_f10
GROUP BY 1, 2 ORDER BY x, y),
t_0_Reach_MultBodyAggAux_recursive_head_f11 AS (SELECT * FROM (
  
    SELECT
      Edge.x AS x,
      Edge.y AS y
    FROM
      t_1_Edge AS Edge
   UNION ALL
  
    SELECT
      Reach_r9.x AS x,
      t_2_Edge.y AS y
    FROM
      t_3_Reach_r9 AS Reach_r9, t_1_Edge AS t_2_Edge
    WHERE
      (t_2_Edge.x = Reach_r9.y)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_recursive_head_f11.x AS x,
  Reach_MultBodyAggAux_recursive_head_f11.y AS y
FROM
  t_0_Reach_MultBodyAggAux_recursive_head_f11 AS Reach_MultBodyAggAux_recursive_head_f11
GROUP BY 1, 2 ORDER BY x, y;