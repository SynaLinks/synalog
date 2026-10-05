WITH t_59_Reach_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_58_Reach_r0 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f1.y AS y
FROM
  t_59_Reach_MultBodyAggAux_recursive_head_f1 AS Reach_MultBodyAggAux_recursive_head_f1
GROUP BY 1),
t_61_Edge AS (SELECT * FROM (
  
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
t_56_Reach_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_57_Edge.y AS y
    FROM
      t_58_Reach_r0 AS Reach_r0, t_61_Edge AS t_57_Edge
    WHERE
      (t_57_Edge.x = Reach_r0.y)
  
) AS UNUSED_TABLE_NAME  ),
t_55_Reach_r1 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f2.y AS y
FROM
  t_56_Reach_MultBodyAggAux_recursive_head_f2 AS Reach_MultBodyAggAux_recursive_head_f2
GROUP BY 1),
t_53_Reach_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_54_Edge.y AS y
    FROM
      t_55_Reach_r1 AS Reach_r1, t_61_Edge AS t_54_Edge
    WHERE
      (t_54_Edge.x = Reach_r1.y)
  
) AS UNUSED_TABLE_NAME  ),
t_52_Reach_r2 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f3.y AS y
FROM
  t_53_Reach_MultBodyAggAux_recursive_head_f3 AS Reach_MultBodyAggAux_recursive_head_f3
GROUP BY 1),
t_50_Reach_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_51_Edge.y AS y
    FROM
      t_52_Reach_r2 AS Reach_r2, t_61_Edge AS t_51_Edge
    WHERE
      (t_51_Edge.x = Reach_r2.y)
  
) AS UNUSED_TABLE_NAME  ),
t_49_Reach_r3 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f4.y AS y
FROM
  t_50_Reach_MultBodyAggAux_recursive_head_f4 AS Reach_MultBodyAggAux_recursive_head_f4
GROUP BY 1),
t_47_Reach_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_48_Edge.y AS y
    FROM
      t_49_Reach_r3 AS Reach_r3, t_61_Edge AS t_48_Edge
    WHERE
      (t_48_Edge.x = Reach_r3.y)
  
) AS UNUSED_TABLE_NAME  ),
t_46_Reach_r4 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f5.y AS y
FROM
  t_47_Reach_MultBodyAggAux_recursive_head_f5 AS Reach_MultBodyAggAux_recursive_head_f5
GROUP BY 1),
t_44_Reach_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_45_Edge.y AS y
    FROM
      t_46_Reach_r4 AS Reach_r4, t_61_Edge AS t_45_Edge
    WHERE
      (t_45_Edge.x = Reach_r4.y)
  
) AS UNUSED_TABLE_NAME  ),
t_43_Reach_r5 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f6.y AS y
FROM
  t_44_Reach_MultBodyAggAux_recursive_head_f6 AS Reach_MultBodyAggAux_recursive_head_f6
GROUP BY 1),
t_41_Reach_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_42_Edge.y AS y
    FROM
      t_43_Reach_r5 AS Reach_r5, t_61_Edge AS t_42_Edge
    WHERE
      (t_42_Edge.x = Reach_r5.y)
  
) AS UNUSED_TABLE_NAME  ),
t_40_Reach_r6 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f7.y AS y
FROM
  t_41_Reach_MultBodyAggAux_recursive_head_f7 AS Reach_MultBodyAggAux_recursive_head_f7
GROUP BY 1),
t_38_Reach_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_39_Edge.y AS y
    FROM
      t_40_Reach_r6 AS Reach_r6, t_61_Edge AS t_39_Edge
    WHERE
      (t_39_Edge.x = Reach_r6.y)
  
) AS UNUSED_TABLE_NAME  ),
t_37_Reach_r7 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f8.y AS y
FROM
  t_38_Reach_MultBodyAggAux_recursive_head_f8 AS Reach_MultBodyAggAux_recursive_head_f8
GROUP BY 1),
t_35_Reach_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_36_Edge.y AS y
    FROM
      t_37_Reach_r7 AS Reach_r7, t_61_Edge AS t_36_Edge
    WHERE
      (t_36_Edge.x = Reach_r7.y)
  
) AS UNUSED_TABLE_NAME  ),
t_34_Reach_r8 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f9.y AS y
FROM
  t_35_Reach_MultBodyAggAux_recursive_head_f9 AS Reach_MultBodyAggAux_recursive_head_f9
GROUP BY 1),
t_32_Reach_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_33_Edge.y AS y
    FROM
      t_34_Reach_r8 AS Reach_r8, t_61_Edge AS t_33_Edge
    WHERE
      (t_33_Edge.x = Reach_r8.y)
  
) AS UNUSED_TABLE_NAME  ),
t_31_Reach_r9 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f10.y AS y
FROM
  t_32_Reach_MultBodyAggAux_recursive_head_f10 AS Reach_MultBodyAggAux_recursive_head_f10
GROUP BY 1),
t_29_Reach_MultBodyAggAux_recursive_head_f11 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_30_Edge.y AS y
    FROM
      t_31_Reach_r9 AS Reach_r9, t_61_Edge AS t_30_Edge
    WHERE
      (t_30_Edge.x = Reach_r9.y)
  
) AS UNUSED_TABLE_NAME  ),
t_28_Reach_r10 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f11.y AS y
FROM
  t_29_Reach_MultBodyAggAux_recursive_head_f11 AS Reach_MultBodyAggAux_recursive_head_f11
GROUP BY 1),
t_26_Reach_MultBodyAggAux_recursive_head_f12 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_27_Edge.y AS y
    FROM
      t_28_Reach_r10 AS Reach_r10, t_61_Edge AS t_27_Edge
    WHERE
      (t_27_Edge.x = Reach_r10.y)
  
) AS UNUSED_TABLE_NAME  ),
t_25_Reach_r11 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f12.y AS y
FROM
  t_26_Reach_MultBodyAggAux_recursive_head_f12 AS Reach_MultBodyAggAux_recursive_head_f12
GROUP BY 1),
t_23_Reach_MultBodyAggAux_recursive_head_f13 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_24_Edge.y AS y
    FROM
      t_25_Reach_r11 AS Reach_r11, t_61_Edge AS t_24_Edge
    WHERE
      (t_24_Edge.x = Reach_r11.y)
  
) AS UNUSED_TABLE_NAME  ),
t_22_Reach_r12 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f13.y AS y
FROM
  t_23_Reach_MultBodyAggAux_recursive_head_f13 AS Reach_MultBodyAggAux_recursive_head_f13
GROUP BY 1),
t_20_Reach_MultBodyAggAux_recursive_head_f14 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_21_Edge.y AS y
    FROM
      t_22_Reach_r12 AS Reach_r12, t_61_Edge AS t_21_Edge
    WHERE
      (t_21_Edge.x = Reach_r12.y)
  
) AS UNUSED_TABLE_NAME  ),
t_19_Reach_r13 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f14.y AS y
FROM
  t_20_Reach_MultBodyAggAux_recursive_head_f14 AS Reach_MultBodyAggAux_recursive_head_f14
GROUP BY 1),
t_17_Reach_MultBodyAggAux_recursive_head_f15 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_18_Edge.y AS y
    FROM
      t_19_Reach_r13 AS Reach_r13, t_61_Edge AS t_18_Edge
    WHERE
      (t_18_Edge.x = Reach_r13.y)
  
) AS UNUSED_TABLE_NAME  ),
t_16_Reach_r14 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f15.y AS y
FROM
  t_17_Reach_MultBodyAggAux_recursive_head_f15 AS Reach_MultBodyAggAux_recursive_head_f15
GROUP BY 1),
t_14_Reach_MultBodyAggAux_recursive_head_f16 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_15_Edge.y AS y
    FROM
      t_16_Reach_r14 AS Reach_r14, t_61_Edge AS t_15_Edge
    WHERE
      (t_15_Edge.x = Reach_r14.y)
  
) AS UNUSED_TABLE_NAME  ),
t_13_Reach_r15 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f16.y AS y
FROM
  t_14_Reach_MultBodyAggAux_recursive_head_f16 AS Reach_MultBodyAggAux_recursive_head_f16
GROUP BY 1),
t_11_Reach_MultBodyAggAux_recursive_head_f17 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_12_Edge.y AS y
    FROM
      t_13_Reach_r15 AS Reach_r15, t_61_Edge AS t_12_Edge
    WHERE
      (t_12_Edge.x = Reach_r15.y)
  
) AS UNUSED_TABLE_NAME  ),
t_10_Reach_r16 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f17.y AS y
FROM
  t_11_Reach_MultBodyAggAux_recursive_head_f17 AS Reach_MultBodyAggAux_recursive_head_f17
GROUP BY 1),
t_8_Reach_MultBodyAggAux_recursive_head_f18 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_9_Edge.y AS y
    FROM
      t_10_Reach_r16 AS Reach_r16, t_61_Edge AS t_9_Edge
    WHERE
      (t_9_Edge.x = Reach_r16.y)
  
) AS UNUSED_TABLE_NAME  ),
t_7_Reach_r17 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f18.y AS y
FROM
  t_8_Reach_MultBodyAggAux_recursive_head_f18 AS Reach_MultBodyAggAux_recursive_head_f18
GROUP BY 1),
t_5_Reach_MultBodyAggAux_recursive_head_f19 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_6_Edge.y AS y
    FROM
      t_7_Reach_r17 AS Reach_r17, t_61_Edge AS t_6_Edge
    WHERE
      (t_6_Edge.x = Reach_r17.y)
  
) AS UNUSED_TABLE_NAME  ),
t_4_Reach_r18 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f19.y AS y
FROM
  t_5_Reach_MultBodyAggAux_recursive_head_f19 AS Reach_MultBodyAggAux_recursive_head_f19
GROUP BY 1),
t_2_Reach_MultBodyAggAux_recursive_head_f20 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      t_3_Edge.y AS y
    FROM
      t_4_Reach_r18 AS Reach_r18, t_61_Edge AS t_3_Edge
    WHERE
      (t_3_Edge.x = Reach_r18.y)
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_r19 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f20.y AS y
FROM
  t_2_Reach_MultBodyAggAux_recursive_head_f20 AS Reach_MultBodyAggAux_recursive_head_f20
GROUP BY 1),
t_0_Reach_MultBodyAggAux_recursive_head_f21 AS (SELECT * FROM (
  
    SELECT
      1 AS y
   UNION ALL
  
    SELECT
      Edge.y AS y
    FROM
      t_1_Reach_r19 AS Reach_r19, t_61_Edge AS Edge
    WHERE
      (Edge.x = Reach_r19.y)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_recursive_head_f21.y AS y
FROM
  t_0_Reach_MultBodyAggAux_recursive_head_f21 AS Reach_MultBodyAggAux_recursive_head_f21
GROUP BY 1 ORDER BY y;