WITH t_2_Edge AS (SELECT * FROM (
  
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
t_41_Reach_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_42_Edge.x AS x,
      t_42_Edge.y AS y
    FROM
      t_2_Edge AS t_42_Edge
  
) AS UNUSED_TABLE_NAME  ),
t_40_Reach_r0 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f1.x AS x,
  Reach_MultBodyAggAux_recursive_head_f1.y AS y
FROM
  t_41_Reach_MultBodyAggAux_recursive_head_f1 AS Reach_MultBodyAggAux_recursive_head_f1
GROUP BY Reach_MultBodyAggAux_recursive_head_f1.x, Reach_MultBodyAggAux_recursive_head_f1.y),
t_37_Reach_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_38_Edge.x AS x,
      t_38_Edge.y AS y
    FROM
      t_2_Edge AS t_38_Edge
   UNION ALL
  
    SELECT
      Reach_r0.x AS x,
      t_39_Edge.y AS y
    FROM
      t_40_Reach_r0 AS Reach_r0, t_2_Edge AS t_39_Edge
    WHERE
      (t_39_Edge.x = Reach_r0.y)
  
) AS UNUSED_TABLE_NAME  ),
t_36_Reach_r1 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f2.x AS x,
  Reach_MultBodyAggAux_recursive_head_f2.y AS y
FROM
  t_37_Reach_MultBodyAggAux_recursive_head_f2 AS Reach_MultBodyAggAux_recursive_head_f2
GROUP BY Reach_MultBodyAggAux_recursive_head_f2.x, Reach_MultBodyAggAux_recursive_head_f2.y),
t_33_Reach_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_34_Edge.x AS x,
      t_34_Edge.y AS y
    FROM
      t_2_Edge AS t_34_Edge
   UNION ALL
  
    SELECT
      Reach_r1.x AS x,
      t_35_Edge.y AS y
    FROM
      t_36_Reach_r1 AS Reach_r1, t_2_Edge AS t_35_Edge
    WHERE
      (t_35_Edge.x = Reach_r1.y)
  
) AS UNUSED_TABLE_NAME  ),
t_32_Reach_r2 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f3.x AS x,
  Reach_MultBodyAggAux_recursive_head_f3.y AS y
FROM
  t_33_Reach_MultBodyAggAux_recursive_head_f3 AS Reach_MultBodyAggAux_recursive_head_f3
GROUP BY Reach_MultBodyAggAux_recursive_head_f3.x, Reach_MultBodyAggAux_recursive_head_f3.y),
t_29_Reach_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_30_Edge.x AS x,
      t_30_Edge.y AS y
    FROM
      t_2_Edge AS t_30_Edge
   UNION ALL
  
    SELECT
      Reach_r2.x AS x,
      t_31_Edge.y AS y
    FROM
      t_32_Reach_r2 AS Reach_r2, t_2_Edge AS t_31_Edge
    WHERE
      (t_31_Edge.x = Reach_r2.y)
  
) AS UNUSED_TABLE_NAME  ),
t_28_Reach_r3 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f4.x AS x,
  Reach_MultBodyAggAux_recursive_head_f4.y AS y
FROM
  t_29_Reach_MultBodyAggAux_recursive_head_f4 AS Reach_MultBodyAggAux_recursive_head_f4
GROUP BY Reach_MultBodyAggAux_recursive_head_f4.x, Reach_MultBodyAggAux_recursive_head_f4.y),
t_25_Reach_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_26_Edge.x AS x,
      t_26_Edge.y AS y
    FROM
      t_2_Edge AS t_26_Edge
   UNION ALL
  
    SELECT
      Reach_r3.x AS x,
      t_27_Edge.y AS y
    FROM
      t_28_Reach_r3 AS Reach_r3, t_2_Edge AS t_27_Edge
    WHERE
      (t_27_Edge.x = Reach_r3.y)
  
) AS UNUSED_TABLE_NAME  ),
t_24_Reach_r4 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f5.x AS x,
  Reach_MultBodyAggAux_recursive_head_f5.y AS y
FROM
  t_25_Reach_MultBodyAggAux_recursive_head_f5 AS Reach_MultBodyAggAux_recursive_head_f5
GROUP BY Reach_MultBodyAggAux_recursive_head_f5.x, Reach_MultBodyAggAux_recursive_head_f5.y),
t_21_Reach_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_22_Edge.x AS x,
      t_22_Edge.y AS y
    FROM
      t_2_Edge AS t_22_Edge
   UNION ALL
  
    SELECT
      Reach_r4.x AS x,
      t_23_Edge.y AS y
    FROM
      t_24_Reach_r4 AS Reach_r4, t_2_Edge AS t_23_Edge
    WHERE
      (t_23_Edge.x = Reach_r4.y)
  
) AS UNUSED_TABLE_NAME  ),
t_20_Reach_r5 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f6.x AS x,
  Reach_MultBodyAggAux_recursive_head_f6.y AS y
FROM
  t_21_Reach_MultBodyAggAux_recursive_head_f6 AS Reach_MultBodyAggAux_recursive_head_f6
GROUP BY Reach_MultBodyAggAux_recursive_head_f6.x, Reach_MultBodyAggAux_recursive_head_f6.y),
t_17_Reach_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_18_Edge.x AS x,
      t_18_Edge.y AS y
    FROM
      t_2_Edge AS t_18_Edge
   UNION ALL
  
    SELECT
      Reach_r5.x AS x,
      t_19_Edge.y AS y
    FROM
      t_20_Reach_r5 AS Reach_r5, t_2_Edge AS t_19_Edge
    WHERE
      (t_19_Edge.x = Reach_r5.y)
  
) AS UNUSED_TABLE_NAME  ),
t_16_Reach_r6 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f7.x AS x,
  Reach_MultBodyAggAux_recursive_head_f7.y AS y
FROM
  t_17_Reach_MultBodyAggAux_recursive_head_f7 AS Reach_MultBodyAggAux_recursive_head_f7
GROUP BY Reach_MultBodyAggAux_recursive_head_f7.x, Reach_MultBodyAggAux_recursive_head_f7.y),
t_13_Reach_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_14_Edge.x AS x,
      t_14_Edge.y AS y
    FROM
      t_2_Edge AS t_14_Edge
   UNION ALL
  
    SELECT
      Reach_r6.x AS x,
      t_15_Edge.y AS y
    FROM
      t_16_Reach_r6 AS Reach_r6, t_2_Edge AS t_15_Edge
    WHERE
      (t_15_Edge.x = Reach_r6.y)
  
) AS UNUSED_TABLE_NAME  ),
t_12_Reach_r7 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f8.x AS x,
  Reach_MultBodyAggAux_recursive_head_f8.y AS y
FROM
  t_13_Reach_MultBodyAggAux_recursive_head_f8 AS Reach_MultBodyAggAux_recursive_head_f8
GROUP BY Reach_MultBodyAggAux_recursive_head_f8.x, Reach_MultBodyAggAux_recursive_head_f8.y),
t_9_Reach_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      t_10_Edge.x AS x,
      t_10_Edge.y AS y
    FROM
      t_2_Edge AS t_10_Edge
   UNION ALL
  
    SELECT
      Reach_r7.x AS x,
      t_11_Edge.y AS y
    FROM
      t_12_Reach_r7 AS Reach_r7, t_2_Edge AS t_11_Edge
    WHERE
      (t_11_Edge.x = Reach_r7.y)
  
) AS UNUSED_TABLE_NAME  ),
t_8_Reach_r8 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f9.x AS x,
  Reach_MultBodyAggAux_recursive_head_f9.y AS y
FROM
  t_9_Reach_MultBodyAggAux_recursive_head_f9 AS Reach_MultBodyAggAux_recursive_head_f9
GROUP BY Reach_MultBodyAggAux_recursive_head_f9.x, Reach_MultBodyAggAux_recursive_head_f9.y),
t_5_Reach_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      t_6_Edge.x AS x,
      t_6_Edge.y AS y
    FROM
      t_2_Edge AS t_6_Edge
   UNION ALL
  
    SELECT
      Reach_r8.x AS x,
      t_7_Edge.y AS y
    FROM
      t_8_Reach_r8 AS Reach_r8, t_2_Edge AS t_7_Edge
    WHERE
      (t_7_Edge.x = Reach_r8.y)
  
) AS UNUSED_TABLE_NAME  ),
t_4_Reach_r9 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f10.x AS x,
  Reach_MultBodyAggAux_recursive_head_f10.y AS y
FROM
  t_5_Reach_MultBodyAggAux_recursive_head_f10 AS Reach_MultBodyAggAux_recursive_head_f10
GROUP BY Reach_MultBodyAggAux_recursive_head_f10.x, Reach_MultBodyAggAux_recursive_head_f10.y),
t_1_Reach_MultBodyAggAux_recursive_head_f11 AS (SELECT * FROM (
  
    SELECT
      Edge.x AS x,
      Edge.y AS y
    FROM
      t_2_Edge AS Edge
   UNION ALL
  
    SELECT
      Reach_r9.x AS x,
      t_3_Edge.y AS y
    FROM
      t_4_Reach_r9 AS Reach_r9, t_2_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.x = Reach_r9.y)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f11.x AS x,
  Reach_MultBodyAggAux_recursive_head_f11.y AS y
FROM
  t_1_Reach_MultBodyAggAux_recursive_head_f11 AS Reach_MultBodyAggAux_recursive_head_f11
GROUP BY Reach_MultBodyAggAux_recursive_head_f11.x, Reach_MultBodyAggAux_recursive_head_f11.y)
SELECT
  SUM(1) AS n
FROM
  t_0_Reach AS Reach;