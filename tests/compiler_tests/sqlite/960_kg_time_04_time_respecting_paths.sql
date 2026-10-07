WITH t_1_HandedOver AS (SELECT * FROM (
  
    SELECT
      'a' AS source,
      'b' AS target,
      '2024-01-01' AS valid_from,
      '2024-03-01' AS valid_to
   UNION ALL
  
    SELECT
      'b' AS source,
      'c' AS target,
      '2024-02-01' AS valid_from,
      '2024-04-01' AS valid_to
   UNION ALL
  
    SELECT
      'c' AS source,
      'd' AS target,
      '2024-05-01' AS valid_from,
      '2024-06-01' AS valid_to
   UNION ALL
  
    SELECT
      'a' AS source,
      'c' AS target,
      '2024-03-15' AS valid_from,
      '2024-04-15' AS valid_to
  
) AS UNUSED_TABLE_NAME  ),
t_40_ReachedBy_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_41_HandedOver.source AS source,
      t_41_HandedOver.target AS target,
      t_41_HandedOver.valid_from AS valid_from,
      t_41_HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS t_41_HandedOver
  
) AS UNUSED_TABLE_NAME  ),
t_39_ReachedBy_r0 AS (SELECT
  ReachedBy_MultBodyAggAux_recursive_head_f1.source AS source,
  ReachedBy_MultBodyAggAux_recursive_head_f1.target AS target,
  ReachedBy_MultBodyAggAux_recursive_head_f1.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_recursive_head_f1.valid_to AS valid_to
FROM
  t_40_ReachedBy_MultBodyAggAux_recursive_head_f1 AS ReachedBy_MultBodyAggAux_recursive_head_f1
GROUP BY ReachedBy_MultBodyAggAux_recursive_head_f1.source, ReachedBy_MultBodyAggAux_recursive_head_f1.target, ReachedBy_MultBodyAggAux_recursive_head_f1.valid_from, ReachedBy_MultBodyAggAux_recursive_head_f1.valid_to),
t_36_ReachedBy_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_37_HandedOver.source AS source,
      t_37_HandedOver.target AS target,
      t_37_HandedOver.valid_from AS valid_from,
      t_37_HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS t_37_HandedOver
   UNION ALL
  
    SELECT
      ReachedBy_r0.source AS source,
      t_38_HandedOver.target AS target,
      CASE WHEN (ReachedBy_r0.valid_from > t_38_HandedOver.valid_from) THEN ReachedBy_r0.valid_from ELSE t_38_HandedOver.valid_from END AS valid_from,
      CASE WHEN (ReachedBy_r0.valid_to < t_38_HandedOver.valid_to) THEN ReachedBy_r0.valid_to ELSE t_38_HandedOver.valid_to END AS valid_to
    FROM
      t_39_ReachedBy_r0 AS ReachedBy_r0, t_1_HandedOver AS t_38_HandedOver
    WHERE
      (CASE WHEN (ReachedBy_r0.valid_from > t_38_HandedOver.valid_from) THEN ReachedBy_r0.valid_from ELSE t_38_HandedOver.valid_from END < CASE WHEN (ReachedBy_r0.valid_to < t_38_HandedOver.valid_to) THEN ReachedBy_r0.valid_to ELSE t_38_HandedOver.valid_to END) AND
      (t_38_HandedOver.source = ReachedBy_r0.target)
  
) AS UNUSED_TABLE_NAME  ),
t_35_ReachedBy_r1 AS (SELECT
  ReachedBy_MultBodyAggAux_recursive_head_f2.source AS source,
  ReachedBy_MultBodyAggAux_recursive_head_f2.target AS target,
  ReachedBy_MultBodyAggAux_recursive_head_f2.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_recursive_head_f2.valid_to AS valid_to
FROM
  t_36_ReachedBy_MultBodyAggAux_recursive_head_f2 AS ReachedBy_MultBodyAggAux_recursive_head_f2
GROUP BY ReachedBy_MultBodyAggAux_recursive_head_f2.source, ReachedBy_MultBodyAggAux_recursive_head_f2.target, ReachedBy_MultBodyAggAux_recursive_head_f2.valid_from, ReachedBy_MultBodyAggAux_recursive_head_f2.valid_to),
t_32_ReachedBy_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_33_HandedOver.source AS source,
      t_33_HandedOver.target AS target,
      t_33_HandedOver.valid_from AS valid_from,
      t_33_HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS t_33_HandedOver
   UNION ALL
  
    SELECT
      ReachedBy_r1.source AS source,
      t_34_HandedOver.target AS target,
      CASE WHEN (ReachedBy_r1.valid_from > t_34_HandedOver.valid_from) THEN ReachedBy_r1.valid_from ELSE t_34_HandedOver.valid_from END AS valid_from,
      CASE WHEN (ReachedBy_r1.valid_to < t_34_HandedOver.valid_to) THEN ReachedBy_r1.valid_to ELSE t_34_HandedOver.valid_to END AS valid_to
    FROM
      t_35_ReachedBy_r1 AS ReachedBy_r1, t_1_HandedOver AS t_34_HandedOver
    WHERE
      (CASE WHEN (ReachedBy_r1.valid_from > t_34_HandedOver.valid_from) THEN ReachedBy_r1.valid_from ELSE t_34_HandedOver.valid_from END < CASE WHEN (ReachedBy_r1.valid_to < t_34_HandedOver.valid_to) THEN ReachedBy_r1.valid_to ELSE t_34_HandedOver.valid_to END) AND
      (t_34_HandedOver.source = ReachedBy_r1.target)
  
) AS UNUSED_TABLE_NAME  ),
t_31_ReachedBy_r2 AS (SELECT
  ReachedBy_MultBodyAggAux_recursive_head_f3.source AS source,
  ReachedBy_MultBodyAggAux_recursive_head_f3.target AS target,
  ReachedBy_MultBodyAggAux_recursive_head_f3.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_recursive_head_f3.valid_to AS valid_to
FROM
  t_32_ReachedBy_MultBodyAggAux_recursive_head_f3 AS ReachedBy_MultBodyAggAux_recursive_head_f3
GROUP BY ReachedBy_MultBodyAggAux_recursive_head_f3.source, ReachedBy_MultBodyAggAux_recursive_head_f3.target, ReachedBy_MultBodyAggAux_recursive_head_f3.valid_from, ReachedBy_MultBodyAggAux_recursive_head_f3.valid_to),
t_28_ReachedBy_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_29_HandedOver.source AS source,
      t_29_HandedOver.target AS target,
      t_29_HandedOver.valid_from AS valid_from,
      t_29_HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS t_29_HandedOver
   UNION ALL
  
    SELECT
      ReachedBy_r2.source AS source,
      t_30_HandedOver.target AS target,
      CASE WHEN (ReachedBy_r2.valid_from > t_30_HandedOver.valid_from) THEN ReachedBy_r2.valid_from ELSE t_30_HandedOver.valid_from END AS valid_from,
      CASE WHEN (ReachedBy_r2.valid_to < t_30_HandedOver.valid_to) THEN ReachedBy_r2.valid_to ELSE t_30_HandedOver.valid_to END AS valid_to
    FROM
      t_31_ReachedBy_r2 AS ReachedBy_r2, t_1_HandedOver AS t_30_HandedOver
    WHERE
      (CASE WHEN (ReachedBy_r2.valid_from > t_30_HandedOver.valid_from) THEN ReachedBy_r2.valid_from ELSE t_30_HandedOver.valid_from END < CASE WHEN (ReachedBy_r2.valid_to < t_30_HandedOver.valid_to) THEN ReachedBy_r2.valid_to ELSE t_30_HandedOver.valid_to END) AND
      (t_30_HandedOver.source = ReachedBy_r2.target)
  
) AS UNUSED_TABLE_NAME  ),
t_27_ReachedBy_r3 AS (SELECT
  ReachedBy_MultBodyAggAux_recursive_head_f4.source AS source,
  ReachedBy_MultBodyAggAux_recursive_head_f4.target AS target,
  ReachedBy_MultBodyAggAux_recursive_head_f4.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_recursive_head_f4.valid_to AS valid_to
FROM
  t_28_ReachedBy_MultBodyAggAux_recursive_head_f4 AS ReachedBy_MultBodyAggAux_recursive_head_f4
GROUP BY ReachedBy_MultBodyAggAux_recursive_head_f4.source, ReachedBy_MultBodyAggAux_recursive_head_f4.target, ReachedBy_MultBodyAggAux_recursive_head_f4.valid_from, ReachedBy_MultBodyAggAux_recursive_head_f4.valid_to),
t_24_ReachedBy_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_25_HandedOver.source AS source,
      t_25_HandedOver.target AS target,
      t_25_HandedOver.valid_from AS valid_from,
      t_25_HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS t_25_HandedOver
   UNION ALL
  
    SELECT
      ReachedBy_r3.source AS source,
      t_26_HandedOver.target AS target,
      CASE WHEN (ReachedBy_r3.valid_from > t_26_HandedOver.valid_from) THEN ReachedBy_r3.valid_from ELSE t_26_HandedOver.valid_from END AS valid_from,
      CASE WHEN (ReachedBy_r3.valid_to < t_26_HandedOver.valid_to) THEN ReachedBy_r3.valid_to ELSE t_26_HandedOver.valid_to END AS valid_to
    FROM
      t_27_ReachedBy_r3 AS ReachedBy_r3, t_1_HandedOver AS t_26_HandedOver
    WHERE
      (CASE WHEN (ReachedBy_r3.valid_from > t_26_HandedOver.valid_from) THEN ReachedBy_r3.valid_from ELSE t_26_HandedOver.valid_from END < CASE WHEN (ReachedBy_r3.valid_to < t_26_HandedOver.valid_to) THEN ReachedBy_r3.valid_to ELSE t_26_HandedOver.valid_to END) AND
      (t_26_HandedOver.source = ReachedBy_r3.target)
  
) AS UNUSED_TABLE_NAME  ),
t_23_ReachedBy_r4 AS (SELECT
  ReachedBy_MultBodyAggAux_recursive_head_f5.source AS source,
  ReachedBy_MultBodyAggAux_recursive_head_f5.target AS target,
  ReachedBy_MultBodyAggAux_recursive_head_f5.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_recursive_head_f5.valid_to AS valid_to
FROM
  t_24_ReachedBy_MultBodyAggAux_recursive_head_f5 AS ReachedBy_MultBodyAggAux_recursive_head_f5
GROUP BY ReachedBy_MultBodyAggAux_recursive_head_f5.source, ReachedBy_MultBodyAggAux_recursive_head_f5.target, ReachedBy_MultBodyAggAux_recursive_head_f5.valid_from, ReachedBy_MultBodyAggAux_recursive_head_f5.valid_to),
t_20_ReachedBy_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_21_HandedOver.source AS source,
      t_21_HandedOver.target AS target,
      t_21_HandedOver.valid_from AS valid_from,
      t_21_HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS t_21_HandedOver
   UNION ALL
  
    SELECT
      ReachedBy_r4.source AS source,
      t_22_HandedOver.target AS target,
      CASE WHEN (ReachedBy_r4.valid_from > t_22_HandedOver.valid_from) THEN ReachedBy_r4.valid_from ELSE t_22_HandedOver.valid_from END AS valid_from,
      CASE WHEN (ReachedBy_r4.valid_to < t_22_HandedOver.valid_to) THEN ReachedBy_r4.valid_to ELSE t_22_HandedOver.valid_to END AS valid_to
    FROM
      t_23_ReachedBy_r4 AS ReachedBy_r4, t_1_HandedOver AS t_22_HandedOver
    WHERE
      (CASE WHEN (ReachedBy_r4.valid_from > t_22_HandedOver.valid_from) THEN ReachedBy_r4.valid_from ELSE t_22_HandedOver.valid_from END < CASE WHEN (ReachedBy_r4.valid_to < t_22_HandedOver.valid_to) THEN ReachedBy_r4.valid_to ELSE t_22_HandedOver.valid_to END) AND
      (t_22_HandedOver.source = ReachedBy_r4.target)
  
) AS UNUSED_TABLE_NAME  ),
t_19_ReachedBy_r5 AS (SELECT
  ReachedBy_MultBodyAggAux_recursive_head_f6.source AS source,
  ReachedBy_MultBodyAggAux_recursive_head_f6.target AS target,
  ReachedBy_MultBodyAggAux_recursive_head_f6.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_recursive_head_f6.valid_to AS valid_to
FROM
  t_20_ReachedBy_MultBodyAggAux_recursive_head_f6 AS ReachedBy_MultBodyAggAux_recursive_head_f6
GROUP BY ReachedBy_MultBodyAggAux_recursive_head_f6.source, ReachedBy_MultBodyAggAux_recursive_head_f6.target, ReachedBy_MultBodyAggAux_recursive_head_f6.valid_from, ReachedBy_MultBodyAggAux_recursive_head_f6.valid_to),
t_16_ReachedBy_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_17_HandedOver.source AS source,
      t_17_HandedOver.target AS target,
      t_17_HandedOver.valid_from AS valid_from,
      t_17_HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS t_17_HandedOver
   UNION ALL
  
    SELECT
      ReachedBy_r5.source AS source,
      t_18_HandedOver.target AS target,
      CASE WHEN (ReachedBy_r5.valid_from > t_18_HandedOver.valid_from) THEN ReachedBy_r5.valid_from ELSE t_18_HandedOver.valid_from END AS valid_from,
      CASE WHEN (ReachedBy_r5.valid_to < t_18_HandedOver.valid_to) THEN ReachedBy_r5.valid_to ELSE t_18_HandedOver.valid_to END AS valid_to
    FROM
      t_19_ReachedBy_r5 AS ReachedBy_r5, t_1_HandedOver AS t_18_HandedOver
    WHERE
      (CASE WHEN (ReachedBy_r5.valid_from > t_18_HandedOver.valid_from) THEN ReachedBy_r5.valid_from ELSE t_18_HandedOver.valid_from END < CASE WHEN (ReachedBy_r5.valid_to < t_18_HandedOver.valid_to) THEN ReachedBy_r5.valid_to ELSE t_18_HandedOver.valid_to END) AND
      (t_18_HandedOver.source = ReachedBy_r5.target)
  
) AS UNUSED_TABLE_NAME  ),
t_15_ReachedBy_r6 AS (SELECT
  ReachedBy_MultBodyAggAux_recursive_head_f7.source AS source,
  ReachedBy_MultBodyAggAux_recursive_head_f7.target AS target,
  ReachedBy_MultBodyAggAux_recursive_head_f7.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_recursive_head_f7.valid_to AS valid_to
FROM
  t_16_ReachedBy_MultBodyAggAux_recursive_head_f7 AS ReachedBy_MultBodyAggAux_recursive_head_f7
GROUP BY ReachedBy_MultBodyAggAux_recursive_head_f7.source, ReachedBy_MultBodyAggAux_recursive_head_f7.target, ReachedBy_MultBodyAggAux_recursive_head_f7.valid_from, ReachedBy_MultBodyAggAux_recursive_head_f7.valid_to),
t_12_ReachedBy_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_13_HandedOver.source AS source,
      t_13_HandedOver.target AS target,
      t_13_HandedOver.valid_from AS valid_from,
      t_13_HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS t_13_HandedOver
   UNION ALL
  
    SELECT
      ReachedBy_r6.source AS source,
      t_14_HandedOver.target AS target,
      CASE WHEN (ReachedBy_r6.valid_from > t_14_HandedOver.valid_from) THEN ReachedBy_r6.valid_from ELSE t_14_HandedOver.valid_from END AS valid_from,
      CASE WHEN (ReachedBy_r6.valid_to < t_14_HandedOver.valid_to) THEN ReachedBy_r6.valid_to ELSE t_14_HandedOver.valid_to END AS valid_to
    FROM
      t_15_ReachedBy_r6 AS ReachedBy_r6, t_1_HandedOver AS t_14_HandedOver
    WHERE
      (CASE WHEN (ReachedBy_r6.valid_from > t_14_HandedOver.valid_from) THEN ReachedBy_r6.valid_from ELSE t_14_HandedOver.valid_from END < CASE WHEN (ReachedBy_r6.valid_to < t_14_HandedOver.valid_to) THEN ReachedBy_r6.valid_to ELSE t_14_HandedOver.valid_to END) AND
      (t_14_HandedOver.source = ReachedBy_r6.target)
  
) AS UNUSED_TABLE_NAME  ),
t_11_ReachedBy_r7 AS (SELECT
  ReachedBy_MultBodyAggAux_recursive_head_f8.source AS source,
  ReachedBy_MultBodyAggAux_recursive_head_f8.target AS target,
  ReachedBy_MultBodyAggAux_recursive_head_f8.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_recursive_head_f8.valid_to AS valid_to
FROM
  t_12_ReachedBy_MultBodyAggAux_recursive_head_f8 AS ReachedBy_MultBodyAggAux_recursive_head_f8
GROUP BY ReachedBy_MultBodyAggAux_recursive_head_f8.source, ReachedBy_MultBodyAggAux_recursive_head_f8.target, ReachedBy_MultBodyAggAux_recursive_head_f8.valid_from, ReachedBy_MultBodyAggAux_recursive_head_f8.valid_to),
t_8_ReachedBy_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      t_9_HandedOver.source AS source,
      t_9_HandedOver.target AS target,
      t_9_HandedOver.valid_from AS valid_from,
      t_9_HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS t_9_HandedOver
   UNION ALL
  
    SELECT
      ReachedBy_r7.source AS source,
      t_10_HandedOver.target AS target,
      CASE WHEN (ReachedBy_r7.valid_from > t_10_HandedOver.valid_from) THEN ReachedBy_r7.valid_from ELSE t_10_HandedOver.valid_from END AS valid_from,
      CASE WHEN (ReachedBy_r7.valid_to < t_10_HandedOver.valid_to) THEN ReachedBy_r7.valid_to ELSE t_10_HandedOver.valid_to END AS valid_to
    FROM
      t_11_ReachedBy_r7 AS ReachedBy_r7, t_1_HandedOver AS t_10_HandedOver
    WHERE
      (CASE WHEN (ReachedBy_r7.valid_from > t_10_HandedOver.valid_from) THEN ReachedBy_r7.valid_from ELSE t_10_HandedOver.valid_from END < CASE WHEN (ReachedBy_r7.valid_to < t_10_HandedOver.valid_to) THEN ReachedBy_r7.valid_to ELSE t_10_HandedOver.valid_to END) AND
      (t_10_HandedOver.source = ReachedBy_r7.target)
  
) AS UNUSED_TABLE_NAME  ),
t_7_ReachedBy_r8 AS (SELECT
  ReachedBy_MultBodyAggAux_recursive_head_f9.source AS source,
  ReachedBy_MultBodyAggAux_recursive_head_f9.target AS target,
  ReachedBy_MultBodyAggAux_recursive_head_f9.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_recursive_head_f9.valid_to AS valid_to
FROM
  t_8_ReachedBy_MultBodyAggAux_recursive_head_f9 AS ReachedBy_MultBodyAggAux_recursive_head_f9
GROUP BY ReachedBy_MultBodyAggAux_recursive_head_f9.source, ReachedBy_MultBodyAggAux_recursive_head_f9.target, ReachedBy_MultBodyAggAux_recursive_head_f9.valid_from, ReachedBy_MultBodyAggAux_recursive_head_f9.valid_to),
t_4_ReachedBy_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      t_5_HandedOver.source AS source,
      t_5_HandedOver.target AS target,
      t_5_HandedOver.valid_from AS valid_from,
      t_5_HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS t_5_HandedOver
   UNION ALL
  
    SELECT
      ReachedBy_r8.source AS source,
      t_6_HandedOver.target AS target,
      CASE WHEN (ReachedBy_r8.valid_from > t_6_HandedOver.valid_from) THEN ReachedBy_r8.valid_from ELSE t_6_HandedOver.valid_from END AS valid_from,
      CASE WHEN (ReachedBy_r8.valid_to < t_6_HandedOver.valid_to) THEN ReachedBy_r8.valid_to ELSE t_6_HandedOver.valid_to END AS valid_to
    FROM
      t_7_ReachedBy_r8 AS ReachedBy_r8, t_1_HandedOver AS t_6_HandedOver
    WHERE
      (CASE WHEN (ReachedBy_r8.valid_from > t_6_HandedOver.valid_from) THEN ReachedBy_r8.valid_from ELSE t_6_HandedOver.valid_from END < CASE WHEN (ReachedBy_r8.valid_to < t_6_HandedOver.valid_to) THEN ReachedBy_r8.valid_to ELSE t_6_HandedOver.valid_to END) AND
      (t_6_HandedOver.source = ReachedBy_r8.target)
  
) AS UNUSED_TABLE_NAME  ),
t_3_ReachedBy_r9 AS (SELECT
  ReachedBy_MultBodyAggAux_recursive_head_f10.source AS source,
  ReachedBy_MultBodyAggAux_recursive_head_f10.target AS target,
  ReachedBy_MultBodyAggAux_recursive_head_f10.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_recursive_head_f10.valid_to AS valid_to
FROM
  t_4_ReachedBy_MultBodyAggAux_recursive_head_f10 AS ReachedBy_MultBodyAggAux_recursive_head_f10
GROUP BY ReachedBy_MultBodyAggAux_recursive_head_f10.source, ReachedBy_MultBodyAggAux_recursive_head_f10.target, ReachedBy_MultBodyAggAux_recursive_head_f10.valid_from, ReachedBy_MultBodyAggAux_recursive_head_f10.valid_to),
t_0_ReachedBy_MultBodyAggAux_recursive_head_f11 AS (SELECT * FROM (
  
    SELECT
      HandedOver.source AS source,
      HandedOver.target AS target,
      HandedOver.valid_from AS valid_from,
      HandedOver.valid_to AS valid_to
    FROM
      t_1_HandedOver AS HandedOver
   UNION ALL
  
    SELECT
      ReachedBy_r9.source AS source,
      t_2_HandedOver.target AS target,
      CASE WHEN (ReachedBy_r9.valid_from > t_2_HandedOver.valid_from) THEN ReachedBy_r9.valid_from ELSE t_2_HandedOver.valid_from END AS valid_from,
      CASE WHEN (ReachedBy_r9.valid_to < t_2_HandedOver.valid_to) THEN ReachedBy_r9.valid_to ELSE t_2_HandedOver.valid_to END AS valid_to
    FROM
      t_3_ReachedBy_r9 AS ReachedBy_r9, t_1_HandedOver AS t_2_HandedOver
    WHERE
      (CASE WHEN (ReachedBy_r9.valid_from > t_2_HandedOver.valid_from) THEN ReachedBy_r9.valid_from ELSE t_2_HandedOver.valid_from END < CASE WHEN (ReachedBy_r9.valid_to < t_2_HandedOver.valid_to) THEN ReachedBy_r9.valid_to ELSE t_2_HandedOver.valid_to END) AND
      (t_2_HandedOver.source = ReachedBy_r9.target)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ReachedBy_MultBodyAggAux_recursive_head_f11.source AS source,
  ReachedBy_MultBodyAggAux_recursive_head_f11.target AS target,
  ReachedBy_MultBodyAggAux_recursive_head_f11.valid_from AS valid_from,
  ReachedBy_MultBodyAggAux_recursive_head_f11.valid_to AS valid_to
FROM
  t_0_ReachedBy_MultBodyAggAux_recursive_head_f11 AS ReachedBy_MultBodyAggAux_recursive_head_f11
GROUP BY ReachedBy_MultBodyAggAux_recursive_head_f11.source, ReachedBy_MultBodyAggAux_recursive_head_f11.target, ReachedBy_MultBodyAggAux_recursive_head_f11.valid_from, ReachedBy_MultBodyAggAux_recursive_head_f11.valid_to ORDER BY source NULLS LAST, target NULLS LAST, valid_from NULLS LAST;