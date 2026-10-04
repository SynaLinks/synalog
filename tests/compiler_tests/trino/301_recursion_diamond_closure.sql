WITH t_2_Edge AS (SELECT * FROM (
  
    SELECT
      's' AS a,
      'l' AS b
   UNION ALL
  
    SELECT
      's' AS a,
      'r' AS b
   UNION ALL
  
    SELECT
      'l' AS a,
      't' AS b
   UNION ALL
  
    SELECT
      'r' AS a,
      't' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_41_Reach_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_42_Edge.a AS a,
      t_42_Edge.b AS b
    FROM
      t_2_Edge AS t_42_Edge
  
) AS UNUSED_TABLE_NAME  ),
t_40_Reach_r0 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f1.a AS a,
  Reach_MultBodyAggAux_recursive_head_f1.b AS b
FROM
  t_41_Reach_MultBodyAggAux_recursive_head_f1 AS Reach_MultBodyAggAux_recursive_head_f1
GROUP BY 1, 2),
t_37_Reach_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_38_Edge.a AS a,
      t_38_Edge.b AS b
    FROM
      t_2_Edge AS t_38_Edge
   UNION ALL
  
    SELECT
      Reach_r0.a AS a,
      t_39_Edge.b AS b
    FROM
      t_40_Reach_r0 AS Reach_r0, t_2_Edge AS t_39_Edge
    WHERE
      (t_39_Edge.a = Reach_r0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_36_Reach_r1 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f2.a AS a,
  Reach_MultBodyAggAux_recursive_head_f2.b AS b
FROM
  t_37_Reach_MultBodyAggAux_recursive_head_f2 AS Reach_MultBodyAggAux_recursive_head_f2
GROUP BY 1, 2),
t_33_Reach_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_34_Edge.a AS a,
      t_34_Edge.b AS b
    FROM
      t_2_Edge AS t_34_Edge
   UNION ALL
  
    SELECT
      Reach_r1.a AS a,
      t_35_Edge.b AS b
    FROM
      t_36_Reach_r1 AS Reach_r1, t_2_Edge AS t_35_Edge
    WHERE
      (t_35_Edge.a = Reach_r1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_32_Reach_r2 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f3.a AS a,
  Reach_MultBodyAggAux_recursive_head_f3.b AS b
FROM
  t_33_Reach_MultBodyAggAux_recursive_head_f3 AS Reach_MultBodyAggAux_recursive_head_f3
GROUP BY 1, 2),
t_29_Reach_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_30_Edge.a AS a,
      t_30_Edge.b AS b
    FROM
      t_2_Edge AS t_30_Edge
   UNION ALL
  
    SELECT
      Reach_r2.a AS a,
      t_31_Edge.b AS b
    FROM
      t_32_Reach_r2 AS Reach_r2, t_2_Edge AS t_31_Edge
    WHERE
      (t_31_Edge.a = Reach_r2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_28_Reach_r3 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f4.a AS a,
  Reach_MultBodyAggAux_recursive_head_f4.b AS b
FROM
  t_29_Reach_MultBodyAggAux_recursive_head_f4 AS Reach_MultBodyAggAux_recursive_head_f4
GROUP BY 1, 2),
t_25_Reach_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_26_Edge.a AS a,
      t_26_Edge.b AS b
    FROM
      t_2_Edge AS t_26_Edge
   UNION ALL
  
    SELECT
      Reach_r3.a AS a,
      t_27_Edge.b AS b
    FROM
      t_28_Reach_r3 AS Reach_r3, t_2_Edge AS t_27_Edge
    WHERE
      (t_27_Edge.a = Reach_r3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_24_Reach_r4 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f5.a AS a,
  Reach_MultBodyAggAux_recursive_head_f5.b AS b
FROM
  t_25_Reach_MultBodyAggAux_recursive_head_f5 AS Reach_MultBodyAggAux_recursive_head_f5
GROUP BY 1, 2),
t_21_Reach_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_22_Edge.a AS a,
      t_22_Edge.b AS b
    FROM
      t_2_Edge AS t_22_Edge
   UNION ALL
  
    SELECT
      Reach_r4.a AS a,
      t_23_Edge.b AS b
    FROM
      t_24_Reach_r4 AS Reach_r4, t_2_Edge AS t_23_Edge
    WHERE
      (t_23_Edge.a = Reach_r4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_20_Reach_r5 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f6.a AS a,
  Reach_MultBodyAggAux_recursive_head_f6.b AS b
FROM
  t_21_Reach_MultBodyAggAux_recursive_head_f6 AS Reach_MultBodyAggAux_recursive_head_f6
GROUP BY 1, 2),
t_17_Reach_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_18_Edge.a AS a,
      t_18_Edge.b AS b
    FROM
      t_2_Edge AS t_18_Edge
   UNION ALL
  
    SELECT
      Reach_r5.a AS a,
      t_19_Edge.b AS b
    FROM
      t_20_Reach_r5 AS Reach_r5, t_2_Edge AS t_19_Edge
    WHERE
      (t_19_Edge.a = Reach_r5.b)
  
) AS UNUSED_TABLE_NAME  ),
t_16_Reach_r6 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f7.a AS a,
  Reach_MultBodyAggAux_recursive_head_f7.b AS b
FROM
  t_17_Reach_MultBodyAggAux_recursive_head_f7 AS Reach_MultBodyAggAux_recursive_head_f7
GROUP BY 1, 2),
t_13_Reach_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_14_Edge.a AS a,
      t_14_Edge.b AS b
    FROM
      t_2_Edge AS t_14_Edge
   UNION ALL
  
    SELECT
      Reach_r6.a AS a,
      t_15_Edge.b AS b
    FROM
      t_16_Reach_r6 AS Reach_r6, t_2_Edge AS t_15_Edge
    WHERE
      (t_15_Edge.a = Reach_r6.b)
  
) AS UNUSED_TABLE_NAME  ),
t_12_Reach_r7 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f8.a AS a,
  Reach_MultBodyAggAux_recursive_head_f8.b AS b
FROM
  t_13_Reach_MultBodyAggAux_recursive_head_f8 AS Reach_MultBodyAggAux_recursive_head_f8
GROUP BY 1, 2),
t_9_Reach_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      t_10_Edge.a AS a,
      t_10_Edge.b AS b
    FROM
      t_2_Edge AS t_10_Edge
   UNION ALL
  
    SELECT
      Reach_r7.a AS a,
      t_11_Edge.b AS b
    FROM
      t_12_Reach_r7 AS Reach_r7, t_2_Edge AS t_11_Edge
    WHERE
      (t_11_Edge.a = Reach_r7.b)
  
) AS UNUSED_TABLE_NAME  ),
t_8_Reach_r8 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f9.a AS a,
  Reach_MultBodyAggAux_recursive_head_f9.b AS b
FROM
  t_9_Reach_MultBodyAggAux_recursive_head_f9 AS Reach_MultBodyAggAux_recursive_head_f9
GROUP BY 1, 2),
t_5_Reach_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      t_6_Edge.a AS a,
      t_6_Edge.b AS b
    FROM
      t_2_Edge AS t_6_Edge
   UNION ALL
  
    SELECT
      Reach_r8.a AS a,
      t_7_Edge.b AS b
    FROM
      t_8_Reach_r8 AS Reach_r8, t_2_Edge AS t_7_Edge
    WHERE
      (t_7_Edge.a = Reach_r8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_4_Reach_r9 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f10.a AS a,
  Reach_MultBodyAggAux_recursive_head_f10.b AS b
FROM
  t_5_Reach_MultBodyAggAux_recursive_head_f10 AS Reach_MultBodyAggAux_recursive_head_f10
GROUP BY 1, 2),
t_1_Reach_MultBodyAggAux_recursive_head_f11 AS (SELECT * FROM (
  
    SELECT
      Edge.a AS a,
      Edge.b AS b
    FROM
      t_2_Edge AS Edge
   UNION ALL
  
    SELECT
      Reach_r9.a AS a,
      t_3_Edge.b AS b
    FROM
      t_4_Reach_r9 AS Reach_r9, t_2_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.a = Reach_r9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f11.a AS a,
  Reach_MultBodyAggAux_recursive_head_f11.b AS b
FROM
  t_1_Reach_MultBodyAggAux_recursive_head_f11 AS Reach_MultBodyAggAux_recursive_head_f11
GROUP BY 1, 2)
SELECT
  SUM(1) AS n
FROM
  t_0_Reach AS Reach;