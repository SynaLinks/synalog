WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      5 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_80_T_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_81_E.a AS a,
      t_81_E.b AS b
    FROM
      t_1_E AS t_81_E
  
) AS UNUSED_TABLE_NAME  ),
t_79_T_r0 AS (SELECT
  T_MultBodyAggAux_recursive_head_f1.a AS a,
  T_MultBodyAggAux_recursive_head_f1.b AS b
FROM
  t_80_T_MultBodyAggAux_recursive_head_f1 AS T_MultBodyAggAux_recursive_head_f1
GROUP BY a, b),
t_76_T_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_77_E.a AS a,
      t_77_E.b AS b
    FROM
      t_1_E AS t_77_E
   UNION ALL
  
    SELECT
      T_r0.a AS a,
      t_78_E.b AS b
    FROM
      t_79_T_r0 AS T_r0, t_1_E AS t_78_E
    WHERE
      (t_78_E.a IS NOT DISTINCT FROM T_r0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_75_T_r1 AS (SELECT
  T_MultBodyAggAux_recursive_head_f2.a AS a,
  T_MultBodyAggAux_recursive_head_f2.b AS b
FROM
  t_76_T_MultBodyAggAux_recursive_head_f2 AS T_MultBodyAggAux_recursive_head_f2
GROUP BY a, b),
t_72_T_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_73_E.a AS a,
      t_73_E.b AS b
    FROM
      t_1_E AS t_73_E
   UNION ALL
  
    SELECT
      T_r1.a AS a,
      t_74_E.b AS b
    FROM
      t_75_T_r1 AS T_r1, t_1_E AS t_74_E
    WHERE
      (t_74_E.a IS NOT DISTINCT FROM T_r1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_71_T_r2 AS (SELECT
  T_MultBodyAggAux_recursive_head_f3.a AS a,
  T_MultBodyAggAux_recursive_head_f3.b AS b
FROM
  t_72_T_MultBodyAggAux_recursive_head_f3 AS T_MultBodyAggAux_recursive_head_f3
GROUP BY a, b),
t_68_T_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_69_E.a AS a,
      t_69_E.b AS b
    FROM
      t_1_E AS t_69_E
   UNION ALL
  
    SELECT
      T_r2.a AS a,
      t_70_E.b AS b
    FROM
      t_71_T_r2 AS T_r2, t_1_E AS t_70_E
    WHERE
      (t_70_E.a IS NOT DISTINCT FROM T_r2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_67_T_r3 AS (SELECT
  T_MultBodyAggAux_recursive_head_f4.a AS a,
  T_MultBodyAggAux_recursive_head_f4.b AS b
FROM
  t_68_T_MultBodyAggAux_recursive_head_f4 AS T_MultBodyAggAux_recursive_head_f4
GROUP BY a, b),
t_64_T_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_65_E.a AS a,
      t_65_E.b AS b
    FROM
      t_1_E AS t_65_E
   UNION ALL
  
    SELECT
      T_r3.a AS a,
      t_66_E.b AS b
    FROM
      t_67_T_r3 AS T_r3, t_1_E AS t_66_E
    WHERE
      (t_66_E.a IS NOT DISTINCT FROM T_r3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_63_T_r4 AS (SELECT
  T_MultBodyAggAux_recursive_head_f5.a AS a,
  T_MultBodyAggAux_recursive_head_f5.b AS b
FROM
  t_64_T_MultBodyAggAux_recursive_head_f5 AS T_MultBodyAggAux_recursive_head_f5
GROUP BY a, b),
t_60_T_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_61_E.a AS a,
      t_61_E.b AS b
    FROM
      t_1_E AS t_61_E
   UNION ALL
  
    SELECT
      T_r4.a AS a,
      t_62_E.b AS b
    FROM
      t_63_T_r4 AS T_r4, t_1_E AS t_62_E
    WHERE
      (t_62_E.a IS NOT DISTINCT FROM T_r4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_59_T_r5 AS (SELECT
  T_MultBodyAggAux_recursive_head_f6.a AS a,
  T_MultBodyAggAux_recursive_head_f6.b AS b
FROM
  t_60_T_MultBodyAggAux_recursive_head_f6 AS T_MultBodyAggAux_recursive_head_f6
GROUP BY a, b),
t_56_T_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_57_E.a AS a,
      t_57_E.b AS b
    FROM
      t_1_E AS t_57_E
   UNION ALL
  
    SELECT
      T_r5.a AS a,
      t_58_E.b AS b
    FROM
      t_59_T_r5 AS T_r5, t_1_E AS t_58_E
    WHERE
      (t_58_E.a IS NOT DISTINCT FROM T_r5.b)
  
) AS UNUSED_TABLE_NAME  ),
t_55_T_r6 AS (SELECT
  T_MultBodyAggAux_recursive_head_f7.a AS a,
  T_MultBodyAggAux_recursive_head_f7.b AS b
FROM
  t_56_T_MultBodyAggAux_recursive_head_f7 AS T_MultBodyAggAux_recursive_head_f7
GROUP BY a, b),
t_52_T_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_53_E.a AS a,
      t_53_E.b AS b
    FROM
      t_1_E AS t_53_E
   UNION ALL
  
    SELECT
      T_r6.a AS a,
      t_54_E.b AS b
    FROM
      t_55_T_r6 AS T_r6, t_1_E AS t_54_E
    WHERE
      (t_54_E.a IS NOT DISTINCT FROM T_r6.b)
  
) AS UNUSED_TABLE_NAME  ),
t_51_T_r7 AS (SELECT
  T_MultBodyAggAux_recursive_head_f8.a AS a,
  T_MultBodyAggAux_recursive_head_f8.b AS b
FROM
  t_52_T_MultBodyAggAux_recursive_head_f8 AS T_MultBodyAggAux_recursive_head_f8
GROUP BY a, b),
t_48_T_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      t_49_E.a AS a,
      t_49_E.b AS b
    FROM
      t_1_E AS t_49_E
   UNION ALL
  
    SELECT
      T_r7.a AS a,
      t_50_E.b AS b
    FROM
      t_51_T_r7 AS T_r7, t_1_E AS t_50_E
    WHERE
      (t_50_E.a IS NOT DISTINCT FROM T_r7.b)
  
) AS UNUSED_TABLE_NAME  ),
t_47_T_r8 AS (SELECT
  T_MultBodyAggAux_recursive_head_f9.a AS a,
  T_MultBodyAggAux_recursive_head_f9.b AS b
FROM
  t_48_T_MultBodyAggAux_recursive_head_f9 AS T_MultBodyAggAux_recursive_head_f9
GROUP BY a, b),
t_44_T_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      t_45_E.a AS a,
      t_45_E.b AS b
    FROM
      t_1_E AS t_45_E
   UNION ALL
  
    SELECT
      T_r8.a AS a,
      t_46_E.b AS b
    FROM
      t_47_T_r8 AS T_r8, t_1_E AS t_46_E
    WHERE
      (t_46_E.a IS NOT DISTINCT FROM T_r8.b)
  
) AS UNUSED_TABLE_NAME  ),
t_43_T_r9 AS (SELECT
  T_MultBodyAggAux_recursive_head_f10.a AS a,
  T_MultBodyAggAux_recursive_head_f10.b AS b
FROM
  t_44_T_MultBodyAggAux_recursive_head_f10 AS T_MultBodyAggAux_recursive_head_f10
GROUP BY a, b),
t_40_T_MultBodyAggAux_recursive_head_f11 AS (SELECT * FROM (
  
    SELECT
      t_41_E.a AS a,
      t_41_E.b AS b
    FROM
      t_1_E AS t_41_E
   UNION ALL
  
    SELECT
      T_r9.a AS a,
      t_42_E.b AS b
    FROM
      t_43_T_r9 AS T_r9, t_1_E AS t_42_E
    WHERE
      (t_42_E.a IS NOT DISTINCT FROM T_r9.b)
  
) AS UNUSED_TABLE_NAME  ),
t_39_T_r10 AS (SELECT
  T_MultBodyAggAux_recursive_head_f11.a AS a,
  T_MultBodyAggAux_recursive_head_f11.b AS b
FROM
  t_40_T_MultBodyAggAux_recursive_head_f11 AS T_MultBodyAggAux_recursive_head_f11
GROUP BY a, b),
t_36_T_MultBodyAggAux_recursive_head_f12 AS (SELECT * FROM (
  
    SELECT
      t_37_E.a AS a,
      t_37_E.b AS b
    FROM
      t_1_E AS t_37_E
   UNION ALL
  
    SELECT
      T_r10.a AS a,
      t_38_E.b AS b
    FROM
      t_39_T_r10 AS T_r10, t_1_E AS t_38_E
    WHERE
      (t_38_E.a IS NOT DISTINCT FROM T_r10.b)
  
) AS UNUSED_TABLE_NAME  ),
t_35_T_r11 AS (SELECT
  T_MultBodyAggAux_recursive_head_f12.a AS a,
  T_MultBodyAggAux_recursive_head_f12.b AS b
FROM
  t_36_T_MultBodyAggAux_recursive_head_f12 AS T_MultBodyAggAux_recursive_head_f12
GROUP BY a, b),
t_32_T_MultBodyAggAux_recursive_head_f13 AS (SELECT * FROM (
  
    SELECT
      t_33_E.a AS a,
      t_33_E.b AS b
    FROM
      t_1_E AS t_33_E
   UNION ALL
  
    SELECT
      T_r11.a AS a,
      t_34_E.b AS b
    FROM
      t_35_T_r11 AS T_r11, t_1_E AS t_34_E
    WHERE
      (t_34_E.a IS NOT DISTINCT FROM T_r11.b)
  
) AS UNUSED_TABLE_NAME  ),
t_31_T_r12 AS (SELECT
  T_MultBodyAggAux_recursive_head_f13.a AS a,
  T_MultBodyAggAux_recursive_head_f13.b AS b
FROM
  t_32_T_MultBodyAggAux_recursive_head_f13 AS T_MultBodyAggAux_recursive_head_f13
GROUP BY a, b),
t_28_T_MultBodyAggAux_recursive_head_f14 AS (SELECT * FROM (
  
    SELECT
      t_29_E.a AS a,
      t_29_E.b AS b
    FROM
      t_1_E AS t_29_E
   UNION ALL
  
    SELECT
      T_r12.a AS a,
      t_30_E.b AS b
    FROM
      t_31_T_r12 AS T_r12, t_1_E AS t_30_E
    WHERE
      (t_30_E.a IS NOT DISTINCT FROM T_r12.b)
  
) AS UNUSED_TABLE_NAME  ),
t_27_T_r13 AS (SELECT
  T_MultBodyAggAux_recursive_head_f14.a AS a,
  T_MultBodyAggAux_recursive_head_f14.b AS b
FROM
  t_28_T_MultBodyAggAux_recursive_head_f14 AS T_MultBodyAggAux_recursive_head_f14
GROUP BY a, b),
t_24_T_MultBodyAggAux_recursive_head_f15 AS (SELECT * FROM (
  
    SELECT
      t_25_E.a AS a,
      t_25_E.b AS b
    FROM
      t_1_E AS t_25_E
   UNION ALL
  
    SELECT
      T_r13.a AS a,
      t_26_E.b AS b
    FROM
      t_27_T_r13 AS T_r13, t_1_E AS t_26_E
    WHERE
      (t_26_E.a IS NOT DISTINCT FROM T_r13.b)
  
) AS UNUSED_TABLE_NAME  ),
t_23_T_r14 AS (SELECT
  T_MultBodyAggAux_recursive_head_f15.a AS a,
  T_MultBodyAggAux_recursive_head_f15.b AS b
FROM
  t_24_T_MultBodyAggAux_recursive_head_f15 AS T_MultBodyAggAux_recursive_head_f15
GROUP BY a, b),
t_20_T_MultBodyAggAux_recursive_head_f16 AS (SELECT * FROM (
  
    SELECT
      t_21_E.a AS a,
      t_21_E.b AS b
    FROM
      t_1_E AS t_21_E
   UNION ALL
  
    SELECT
      T_r14.a AS a,
      t_22_E.b AS b
    FROM
      t_23_T_r14 AS T_r14, t_1_E AS t_22_E
    WHERE
      (t_22_E.a IS NOT DISTINCT FROM T_r14.b)
  
) AS UNUSED_TABLE_NAME  ),
t_19_T_r15 AS (SELECT
  T_MultBodyAggAux_recursive_head_f16.a AS a,
  T_MultBodyAggAux_recursive_head_f16.b AS b
FROM
  t_20_T_MultBodyAggAux_recursive_head_f16 AS T_MultBodyAggAux_recursive_head_f16
GROUP BY a, b),
t_16_T_MultBodyAggAux_recursive_head_f17 AS (SELECT * FROM (
  
    SELECT
      t_17_E.a AS a,
      t_17_E.b AS b
    FROM
      t_1_E AS t_17_E
   UNION ALL
  
    SELECT
      T_r15.a AS a,
      t_18_E.b AS b
    FROM
      t_19_T_r15 AS T_r15, t_1_E AS t_18_E
    WHERE
      (t_18_E.a IS NOT DISTINCT FROM T_r15.b)
  
) AS UNUSED_TABLE_NAME  ),
t_15_T_r16 AS (SELECT
  T_MultBodyAggAux_recursive_head_f17.a AS a,
  T_MultBodyAggAux_recursive_head_f17.b AS b
FROM
  t_16_T_MultBodyAggAux_recursive_head_f17 AS T_MultBodyAggAux_recursive_head_f17
GROUP BY a, b),
t_12_T_MultBodyAggAux_recursive_head_f18 AS (SELECT * FROM (
  
    SELECT
      t_13_E.a AS a,
      t_13_E.b AS b
    FROM
      t_1_E AS t_13_E
   UNION ALL
  
    SELECT
      T_r16.a AS a,
      t_14_E.b AS b
    FROM
      t_15_T_r16 AS T_r16, t_1_E AS t_14_E
    WHERE
      (t_14_E.a IS NOT DISTINCT FROM T_r16.b)
  
) AS UNUSED_TABLE_NAME  ),
t_11_T_r17 AS (SELECT
  T_MultBodyAggAux_recursive_head_f18.a AS a,
  T_MultBodyAggAux_recursive_head_f18.b AS b
FROM
  t_12_T_MultBodyAggAux_recursive_head_f18 AS T_MultBodyAggAux_recursive_head_f18
GROUP BY a, b),
t_8_T_MultBodyAggAux_recursive_head_f19 AS (SELECT * FROM (
  
    SELECT
      t_9_E.a AS a,
      t_9_E.b AS b
    FROM
      t_1_E AS t_9_E
   UNION ALL
  
    SELECT
      T_r17.a AS a,
      t_10_E.b AS b
    FROM
      t_11_T_r17 AS T_r17, t_1_E AS t_10_E
    WHERE
      (t_10_E.a IS NOT DISTINCT FROM T_r17.b)
  
) AS UNUSED_TABLE_NAME  ),
t_7_T_r18 AS (SELECT
  T_MultBodyAggAux_recursive_head_f19.a AS a,
  T_MultBodyAggAux_recursive_head_f19.b AS b
FROM
  t_8_T_MultBodyAggAux_recursive_head_f19 AS T_MultBodyAggAux_recursive_head_f19
GROUP BY a, b),
t_4_T_MultBodyAggAux_recursive_head_f20 AS (SELECT * FROM (
  
    SELECT
      t_5_E.a AS a,
      t_5_E.b AS b
    FROM
      t_1_E AS t_5_E
   UNION ALL
  
    SELECT
      T_r18.a AS a,
      t_6_E.b AS b
    FROM
      t_7_T_r18 AS T_r18, t_1_E AS t_6_E
    WHERE
      (t_6_E.a IS NOT DISTINCT FROM T_r18.b)
  
) AS UNUSED_TABLE_NAME  ),
t_3_T_r19 AS (SELECT
  T_MultBodyAggAux_recursive_head_f20.a AS a,
  T_MultBodyAggAux_recursive_head_f20.b AS b
FROM
  t_4_T_MultBodyAggAux_recursive_head_f20 AS T_MultBodyAggAux_recursive_head_f20
GROUP BY a, b),
t_0_T_MultBodyAggAux_recursive_head_f21 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      T_r19.a AS a,
      t_2_E.b AS b
    FROM
      t_3_T_r19 AS T_r19, t_1_E AS t_2_E
    WHERE
      (t_2_E.a IS NOT DISTINCT FROM T_r19.b)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T_MultBodyAggAux_recursive_head_f21.a AS a,
  T_MultBodyAggAux_recursive_head_f21.b AS b
FROM
  t_0_T_MultBodyAggAux_recursive_head_f21 AS T_MultBodyAggAux_recursive_head_f21
GROUP BY a, b ORDER BY a NULLS LAST, b NULLS LAST;