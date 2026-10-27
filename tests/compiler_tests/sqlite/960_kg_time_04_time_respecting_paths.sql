WITH RECURSIVE t_1_HandedOver AS (SELECT * FROM (
  
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
t_0_ReachedBy_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        HandedOver.source AS source,
        HandedOver.target AS target,
        HandedOver.valid_from AS valid_from,
        HandedOver.valid_to AS valid_to,
        0 AS synalog_step
      FROM
        t_1_HandedOver AS HandedOver
     UNION ALL
    
      SELECT
        t_4_HandedOver.source AS source,
        t_2_HandedOver.target AS target,
        CASE WHEN (t_4_HandedOver.valid_from > t_2_HandedOver.valid_from) THEN t_4_HandedOver.valid_from ELSE t_2_HandedOver.valid_from END AS valid_from,
        CASE WHEN (t_4_HandedOver.valid_to < t_2_HandedOver.valid_to) THEN t_4_HandedOver.valid_to ELSE t_2_HandedOver.valid_to END AS valid_to,
        ((0) + (1)) AS synalog_step
      FROM
        t_1_HandedOver AS t_4_HandedOver, t_1_HandedOver AS t_2_HandedOver
      WHERE
        (CASE WHEN (t_4_HandedOver.valid_from > t_2_HandedOver.valid_from) THEN t_4_HandedOver.valid_from ELSE t_2_HandedOver.valid_from END < CASE WHEN (t_4_HandedOver.valid_to < t_2_HandedOver.valid_to) THEN t_4_HandedOver.valid_to ELSE t_2_HandedOver.valid_to END) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_2_HandedOver.source IS t_4_HandedOver.target)
     UNION ALL
    
      SELECT
        t_10_HandedOver.source AS source,
        t_6_HandedOver.target AS target,
        CASE WHEN (CASE WHEN (t_10_HandedOver.valid_from > t_8_HandedOver.valid_from) THEN t_10_HandedOver.valid_from ELSE t_8_HandedOver.valid_from END > t_6_HandedOver.valid_from) THEN CASE WHEN (t_10_HandedOver.valid_from > t_8_HandedOver.valid_from) THEN t_10_HandedOver.valid_from ELSE t_8_HandedOver.valid_from END ELSE t_6_HandedOver.valid_from END AS valid_from,
        CASE WHEN (CASE WHEN (t_10_HandedOver.valid_to < t_8_HandedOver.valid_to) THEN t_10_HandedOver.valid_to ELSE t_8_HandedOver.valid_to END < t_6_HandedOver.valid_to) THEN CASE WHEN (t_10_HandedOver.valid_to < t_8_HandedOver.valid_to) THEN t_10_HandedOver.valid_to ELSE t_8_HandedOver.valid_to END ELSE t_6_HandedOver.valid_to END AS valid_to,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_1_HandedOver AS t_10_HandedOver, t_1_HandedOver AS t_8_HandedOver, t_1_HandedOver AS t_6_HandedOver
      WHERE
        (CASE WHEN (CASE WHEN (t_10_HandedOver.valid_from > t_8_HandedOver.valid_from) THEN t_10_HandedOver.valid_from ELSE t_8_HandedOver.valid_from END > t_6_HandedOver.valid_from) THEN CASE WHEN (t_10_HandedOver.valid_from > t_8_HandedOver.valid_from) THEN t_10_HandedOver.valid_from ELSE t_8_HandedOver.valid_from END ELSE t_6_HandedOver.valid_from END < CASE WHEN (CASE WHEN (t_10_HandedOver.valid_to < t_8_HandedOver.valid_to) THEN t_10_HandedOver.valid_to ELSE t_8_HandedOver.valid_to END < t_6_HandedOver.valid_to) THEN CASE WHEN (t_10_HandedOver.valid_to < t_8_HandedOver.valid_to) THEN t_10_HandedOver.valid_to ELSE t_8_HandedOver.valid_to END ELSE t_6_HandedOver.valid_to END) AND
        (((0) + (1)) < 10) AND
        (CASE WHEN (t_10_HandedOver.valid_from > t_8_HandedOver.valid_from) THEN t_10_HandedOver.valid_from ELSE t_8_HandedOver.valid_from END < CASE WHEN (t_10_HandedOver.valid_to < t_8_HandedOver.valid_to) THEN t_10_HandedOver.valid_to ELSE t_8_HandedOver.valid_to END) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_6_HandedOver.source IS t_8_HandedOver.target) AND
        (t_8_HandedOver.source IS t_10_HandedOver.target)
     UNION ALL
    
      SELECT
        t_18_HandedOver.source AS source,
        t_12_HandedOver.target AS target,
        CASE WHEN (CASE WHEN (CASE WHEN (t_18_HandedOver.valid_from > t_16_HandedOver.valid_from) THEN t_18_HandedOver.valid_from ELSE t_16_HandedOver.valid_from END > t_14_HandedOver.valid_from) THEN CASE WHEN (t_18_HandedOver.valid_from > t_16_HandedOver.valid_from) THEN t_18_HandedOver.valid_from ELSE t_16_HandedOver.valid_from END ELSE t_14_HandedOver.valid_from END > t_12_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_18_HandedOver.valid_from > t_16_HandedOver.valid_from) THEN t_18_HandedOver.valid_from ELSE t_16_HandedOver.valid_from END > t_14_HandedOver.valid_from) THEN CASE WHEN (t_18_HandedOver.valid_from > t_16_HandedOver.valid_from) THEN t_18_HandedOver.valid_from ELSE t_16_HandedOver.valid_from END ELSE t_14_HandedOver.valid_from END ELSE t_12_HandedOver.valid_from END AS valid_from,
        CASE WHEN (CASE WHEN (CASE WHEN (t_18_HandedOver.valid_to < t_16_HandedOver.valid_to) THEN t_18_HandedOver.valid_to ELSE t_16_HandedOver.valid_to END < t_14_HandedOver.valid_to) THEN CASE WHEN (t_18_HandedOver.valid_to < t_16_HandedOver.valid_to) THEN t_18_HandedOver.valid_to ELSE t_16_HandedOver.valid_to END ELSE t_14_HandedOver.valid_to END < t_12_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_18_HandedOver.valid_to < t_16_HandedOver.valid_to) THEN t_18_HandedOver.valid_to ELSE t_16_HandedOver.valid_to END < t_14_HandedOver.valid_to) THEN CASE WHEN (t_18_HandedOver.valid_to < t_16_HandedOver.valid_to) THEN t_18_HandedOver.valid_to ELSE t_16_HandedOver.valid_to END ELSE t_14_HandedOver.valid_to END ELSE t_12_HandedOver.valid_to END AS valid_to,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_HandedOver AS t_18_HandedOver, t_1_HandedOver AS t_16_HandedOver, t_1_HandedOver AS t_14_HandedOver, t_1_HandedOver AS t_12_HandedOver
      WHERE
        (CASE WHEN (CASE WHEN (CASE WHEN (t_18_HandedOver.valid_from > t_16_HandedOver.valid_from) THEN t_18_HandedOver.valid_from ELSE t_16_HandedOver.valid_from END > t_14_HandedOver.valid_from) THEN CASE WHEN (t_18_HandedOver.valid_from > t_16_HandedOver.valid_from) THEN t_18_HandedOver.valid_from ELSE t_16_HandedOver.valid_from END ELSE t_14_HandedOver.valid_from END > t_12_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_18_HandedOver.valid_from > t_16_HandedOver.valid_from) THEN t_18_HandedOver.valid_from ELSE t_16_HandedOver.valid_from END > t_14_HandedOver.valid_from) THEN CASE WHEN (t_18_HandedOver.valid_from > t_16_HandedOver.valid_from) THEN t_18_HandedOver.valid_from ELSE t_16_HandedOver.valid_from END ELSE t_14_HandedOver.valid_from END ELSE t_12_HandedOver.valid_from END < CASE WHEN (CASE WHEN (CASE WHEN (t_18_HandedOver.valid_to < t_16_HandedOver.valid_to) THEN t_18_HandedOver.valid_to ELSE t_16_HandedOver.valid_to END < t_14_HandedOver.valid_to) THEN CASE WHEN (t_18_HandedOver.valid_to < t_16_HandedOver.valid_to) THEN t_18_HandedOver.valid_to ELSE t_16_HandedOver.valid_to END ELSE t_14_HandedOver.valid_to END < t_12_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_18_HandedOver.valid_to < t_16_HandedOver.valid_to) THEN t_18_HandedOver.valid_to ELSE t_16_HandedOver.valid_to END < t_14_HandedOver.valid_to) THEN CASE WHEN (t_18_HandedOver.valid_to < t_16_HandedOver.valid_to) THEN t_18_HandedOver.valid_to ELSE t_16_HandedOver.valid_to END ELSE t_14_HandedOver.valid_to END ELSE t_12_HandedOver.valid_to END) AND
        (((((0) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (t_18_HandedOver.valid_from > t_16_HandedOver.valid_from) THEN t_18_HandedOver.valid_from ELSE t_16_HandedOver.valid_from END > t_14_HandedOver.valid_from) THEN CASE WHEN (t_18_HandedOver.valid_from > t_16_HandedOver.valid_from) THEN t_18_HandedOver.valid_from ELSE t_16_HandedOver.valid_from END ELSE t_14_HandedOver.valid_from END < CASE WHEN (CASE WHEN (t_18_HandedOver.valid_to < t_16_HandedOver.valid_to) THEN t_18_HandedOver.valid_to ELSE t_16_HandedOver.valid_to END < t_14_HandedOver.valid_to) THEN CASE WHEN (t_18_HandedOver.valid_to < t_16_HandedOver.valid_to) THEN t_18_HandedOver.valid_to ELSE t_16_HandedOver.valid_to END ELSE t_14_HandedOver.valid_to END) AND
        (((0) + (1)) < 10) AND
        (CASE WHEN (t_18_HandedOver.valid_from > t_16_HandedOver.valid_from) THEN t_18_HandedOver.valid_from ELSE t_16_HandedOver.valid_from END < CASE WHEN (t_18_HandedOver.valid_to < t_16_HandedOver.valid_to) THEN t_18_HandedOver.valid_to ELSE t_16_HandedOver.valid_to END) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_12_HandedOver.source IS t_14_HandedOver.target) AND
        (t_14_HandedOver.source IS t_16_HandedOver.target) AND
        (t_16_HandedOver.source IS t_18_HandedOver.target)
     UNION ALL
    
      SELECT
        t_28_HandedOver.source AS source,
        t_20_HandedOver.target AS target,
        CASE WHEN (x_268.value > t_20_HandedOver.valid_from) THEN x_268.value ELSE t_20_HandedOver.valid_from END AS valid_from,
        CASE WHEN (x_269.value < t_20_HandedOver.valid_to) THEN x_269.value ELSE t_20_HandedOver.valid_to END AS valid_to,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_HandedOver AS t_28_HandedOver, t_1_HandedOver AS t_26_HandedOver, t_1_HandedOver AS t_24_HandedOver, t_1_HandedOver AS t_22_HandedOver, t_1_HandedOver AS t_20_HandedOver, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END > t_24_HandedOver.valid_from) THEN CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END ELSE t_24_HandedOver.valid_from END > t_22_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END > t_24_HandedOver.valid_from) THEN CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END ELSE t_24_HandedOver.valid_from END ELSE t_22_HandedOver.valid_from END)) as x_268, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END < t_24_HandedOver.valid_to) THEN CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END ELSE t_24_HandedOver.valid_to END < t_22_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END < t_24_HandedOver.valid_to) THEN CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END ELSE t_24_HandedOver.valid_to END ELSE t_22_HandedOver.valid_to END)) as x_269
      WHERE
        (CASE WHEN (x_268.value > t_20_HandedOver.valid_from) THEN x_268.value ELSE t_20_HandedOver.valid_from END < CASE WHEN (x_269.value < t_20_HandedOver.valid_to) THEN x_269.value ELSE t_20_HandedOver.valid_to END) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END > t_24_HandedOver.valid_from) THEN CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END ELSE t_24_HandedOver.valid_from END > t_22_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END > t_24_HandedOver.valid_from) THEN CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END ELSE t_24_HandedOver.valid_from END ELSE t_22_HandedOver.valid_from END < CASE WHEN (CASE WHEN (CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END < t_24_HandedOver.valid_to) THEN CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END ELSE t_24_HandedOver.valid_to END < t_22_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END < t_24_HandedOver.valid_to) THEN CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END ELSE t_24_HandedOver.valid_to END ELSE t_22_HandedOver.valid_to END) AND
        (((((0) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END > t_24_HandedOver.valid_from) THEN CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END ELSE t_24_HandedOver.valid_from END < CASE WHEN (CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END < t_24_HandedOver.valid_to) THEN CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END ELSE t_24_HandedOver.valid_to END) AND
        (((0) + (1)) < 10) AND
        (CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END < CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_20_HandedOver.source IS t_22_HandedOver.target) AND
        (t_22_HandedOver.source IS t_24_HandedOver.target) AND
        (t_24_HandedOver.source IS t_26_HandedOver.target) AND
        (t_26_HandedOver.source IS t_28_HandedOver.target)
     UNION ALL
    
      SELECT
        t_40_HandedOver.source AS source,
        t_30_HandedOver.target AS target,
        CASE WHEN (CASE WHEN (x_363.value > t_32_HandedOver.valid_from) THEN x_363.value ELSE t_32_HandedOver.valid_from END > t_30_HandedOver.valid_from) THEN CASE WHEN (x_363.value > t_32_HandedOver.valid_from) THEN x_363.value ELSE t_32_HandedOver.valid_from END ELSE t_30_HandedOver.valid_from END AS valid_from,
        CASE WHEN (CASE WHEN (x_364.value < t_32_HandedOver.valid_to) THEN x_364.value ELSE t_32_HandedOver.valid_to END < t_30_HandedOver.valid_to) THEN CASE WHEN (x_364.value < t_32_HandedOver.valid_to) THEN x_364.value ELSE t_32_HandedOver.valid_to END ELSE t_30_HandedOver.valid_to END AS valid_to,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_HandedOver AS t_40_HandedOver, t_1_HandedOver AS t_38_HandedOver, t_1_HandedOver AS t_36_HandedOver, t_1_HandedOver AS t_34_HandedOver, t_1_HandedOver AS t_32_HandedOver, t_1_HandedOver AS t_30_HandedOver, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END > t_36_HandedOver.valid_from) THEN CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END ELSE t_36_HandedOver.valid_from END > t_34_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END > t_36_HandedOver.valid_from) THEN CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END ELSE t_36_HandedOver.valid_from END ELSE t_34_HandedOver.valid_from END)) as x_363, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END < t_36_HandedOver.valid_to) THEN CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END ELSE t_36_HandedOver.valid_to END < t_34_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END < t_36_HandedOver.valid_to) THEN CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END ELSE t_36_HandedOver.valid_to END ELSE t_34_HandedOver.valid_to END)) as x_364
      WHERE
        (CASE WHEN (CASE WHEN (x_363.value > t_32_HandedOver.valid_from) THEN x_363.value ELSE t_32_HandedOver.valid_from END > t_30_HandedOver.valid_from) THEN CASE WHEN (x_363.value > t_32_HandedOver.valid_from) THEN x_363.value ELSE t_32_HandedOver.valid_from END ELSE t_30_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_364.value < t_32_HandedOver.valid_to) THEN x_364.value ELSE t_32_HandedOver.valid_to END < t_30_HandedOver.valid_to) THEN CASE WHEN (x_364.value < t_32_HandedOver.valid_to) THEN x_364.value ELSE t_32_HandedOver.valid_to END ELSE t_30_HandedOver.valid_to END) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (x_363.value > t_32_HandedOver.valid_from) THEN x_363.value ELSE t_32_HandedOver.valid_from END < CASE WHEN (x_364.value < t_32_HandedOver.valid_to) THEN x_364.value ELSE t_32_HandedOver.valid_to END) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END > t_36_HandedOver.valid_from) THEN CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END ELSE t_36_HandedOver.valid_from END > t_34_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END > t_36_HandedOver.valid_from) THEN CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END ELSE t_36_HandedOver.valid_from END ELSE t_34_HandedOver.valid_from END < CASE WHEN (CASE WHEN (CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END < t_36_HandedOver.valid_to) THEN CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END ELSE t_36_HandedOver.valid_to END < t_34_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END < t_36_HandedOver.valid_to) THEN CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END ELSE t_36_HandedOver.valid_to END ELSE t_34_HandedOver.valid_to END) AND
        (((((0) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END > t_36_HandedOver.valid_from) THEN CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END ELSE t_36_HandedOver.valid_from END < CASE WHEN (CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END < t_36_HandedOver.valid_to) THEN CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END ELSE t_36_HandedOver.valid_to END) AND
        (((0) + (1)) < 10) AND
        (CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END < CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_30_HandedOver.source IS t_32_HandedOver.target) AND
        (t_32_HandedOver.source IS t_34_HandedOver.target) AND
        (t_34_HandedOver.source IS t_36_HandedOver.target) AND
        (t_36_HandedOver.source IS t_38_HandedOver.target) AND
        (t_38_HandedOver.source IS t_40_HandedOver.target)
     UNION ALL
    
      SELECT
        t_54_HandedOver.source AS source,
        t_42_HandedOver.target AS target,
        CASE WHEN (x_473.value > t_42_HandedOver.valid_from) THEN x_473.value ELSE t_42_HandedOver.valid_from END AS valid_from,
        CASE WHEN (x_474.value < t_42_HandedOver.valid_to) THEN x_474.value ELSE t_42_HandedOver.valid_to END AS valid_to,
        ((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_HandedOver AS t_54_HandedOver, t_1_HandedOver AS t_52_HandedOver, t_1_HandedOver AS t_50_HandedOver, t_1_HandedOver AS t_48_HandedOver, t_1_HandedOver AS t_46_HandedOver, t_1_HandedOver AS t_44_HandedOver, t_1_HandedOver AS t_42_HandedOver, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END > t_50_HandedOver.valid_from) THEN CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END ELSE t_50_HandedOver.valid_from END > t_48_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END > t_50_HandedOver.valid_from) THEN CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END ELSE t_50_HandedOver.valid_from END ELSE t_48_HandedOver.valid_from END)) as x_471, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END < t_50_HandedOver.valid_to) THEN CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END ELSE t_50_HandedOver.valid_to END < t_48_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END < t_50_HandedOver.valid_to) THEN CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END ELSE t_50_HandedOver.valid_to END ELSE t_48_HandedOver.valid_to END)) as x_472, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (x_471.value > t_46_HandedOver.valid_from) THEN x_471.value ELSE t_46_HandedOver.valid_from END > t_44_HandedOver.valid_from) THEN CASE WHEN (x_471.value > t_46_HandedOver.valid_from) THEN x_471.value ELSE t_46_HandedOver.valid_from END ELSE t_44_HandedOver.valid_from END)) as x_473, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (x_472.value < t_46_HandedOver.valid_to) THEN x_472.value ELSE t_46_HandedOver.valid_to END < t_44_HandedOver.valid_to) THEN CASE WHEN (x_472.value < t_46_HandedOver.valid_to) THEN x_472.value ELSE t_46_HandedOver.valid_to END ELSE t_44_HandedOver.valid_to END)) as x_474
      WHERE
        (CASE WHEN (x_473.value > t_42_HandedOver.valid_from) THEN x_473.value ELSE t_42_HandedOver.valid_from END < CASE WHEN (x_474.value < t_42_HandedOver.valid_to) THEN x_474.value ELSE t_42_HandedOver.valid_to END) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (x_471.value > t_46_HandedOver.valid_from) THEN x_471.value ELSE t_46_HandedOver.valid_from END > t_44_HandedOver.valid_from) THEN CASE WHEN (x_471.value > t_46_HandedOver.valid_from) THEN x_471.value ELSE t_46_HandedOver.valid_from END ELSE t_44_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_472.value < t_46_HandedOver.valid_to) THEN x_472.value ELSE t_46_HandedOver.valid_to END < t_44_HandedOver.valid_to) THEN CASE WHEN (x_472.value < t_46_HandedOver.valid_to) THEN x_472.value ELSE t_46_HandedOver.valid_to END ELSE t_44_HandedOver.valid_to END) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (x_471.value > t_46_HandedOver.valid_from) THEN x_471.value ELSE t_46_HandedOver.valid_from END < CASE WHEN (x_472.value < t_46_HandedOver.valid_to) THEN x_472.value ELSE t_46_HandedOver.valid_to END) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END > t_50_HandedOver.valid_from) THEN CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END ELSE t_50_HandedOver.valid_from END > t_48_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END > t_50_HandedOver.valid_from) THEN CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END ELSE t_50_HandedOver.valid_from END ELSE t_48_HandedOver.valid_from END < CASE WHEN (CASE WHEN (CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END < t_50_HandedOver.valid_to) THEN CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END ELSE t_50_HandedOver.valid_to END < t_48_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END < t_50_HandedOver.valid_to) THEN CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END ELSE t_50_HandedOver.valid_to END ELSE t_48_HandedOver.valid_to END) AND
        (((((0) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END > t_50_HandedOver.valid_from) THEN CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END ELSE t_50_HandedOver.valid_from END < CASE WHEN (CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END < t_50_HandedOver.valid_to) THEN CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END ELSE t_50_HandedOver.valid_to END) AND
        (((0) + (1)) < 10) AND
        (CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END < CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_42_HandedOver.source IS t_44_HandedOver.target) AND
        (t_44_HandedOver.source IS t_46_HandedOver.target) AND
        (t_46_HandedOver.source IS t_48_HandedOver.target) AND
        (t_48_HandedOver.source IS t_50_HandedOver.target) AND
        (t_50_HandedOver.source IS t_52_HandedOver.target) AND
        (t_52_HandedOver.source IS t_54_HandedOver.target)
     UNION ALL
    
      SELECT
        t_70_HandedOver.source AS source,
        t_56_HandedOver.target AS target,
        CASE WHEN (CASE WHEN (x_596.value > t_58_HandedOver.valid_from) THEN x_596.value ELSE t_58_HandedOver.valid_from END > t_56_HandedOver.valid_from) THEN CASE WHEN (x_596.value > t_58_HandedOver.valid_from) THEN x_596.value ELSE t_58_HandedOver.valid_from END ELSE t_56_HandedOver.valid_from END AS valid_from,
        CASE WHEN (CASE WHEN (x_597.value < t_58_HandedOver.valid_to) THEN x_597.value ELSE t_58_HandedOver.valid_to END < t_56_HandedOver.valid_to) THEN CASE WHEN (x_597.value < t_58_HandedOver.valid_to) THEN x_597.value ELSE t_58_HandedOver.valid_to END ELSE t_56_HandedOver.valid_to END AS valid_to,
        ((x_598.value) + (1)) AS synalog_step
      FROM
        t_1_HandedOver AS t_70_HandedOver, t_1_HandedOver AS t_68_HandedOver, t_1_HandedOver AS t_66_HandedOver, t_1_HandedOver AS t_64_HandedOver, t_1_HandedOver AS t_62_HandedOver, t_1_HandedOver AS t_60_HandedOver, t_1_HandedOver AS t_58_HandedOver, t_1_HandedOver AS t_56_HandedOver, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END > t_66_HandedOver.valid_from) THEN CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END ELSE t_66_HandedOver.valid_from END > t_64_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END > t_66_HandedOver.valid_from) THEN CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END ELSE t_66_HandedOver.valid_from END ELSE t_64_HandedOver.valid_from END)) as x_594, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END < t_66_HandedOver.valid_to) THEN CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END ELSE t_66_HandedOver.valid_to END < t_64_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END < t_66_HandedOver.valid_to) THEN CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END ELSE t_66_HandedOver.valid_to END ELSE t_64_HandedOver.valid_to END)) as x_595, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (x_594.value > t_62_HandedOver.valid_from) THEN x_594.value ELSE t_62_HandedOver.valid_from END > t_60_HandedOver.valid_from) THEN CASE WHEN (x_594.value > t_62_HandedOver.valid_from) THEN x_594.value ELSE t_62_HandedOver.valid_from END ELSE t_60_HandedOver.valid_from END)) as x_596, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (x_595.value < t_62_HandedOver.valid_to) THEN x_595.value ELSE t_62_HandedOver.valid_to END < t_60_HandedOver.valid_to) THEN CASE WHEN (x_595.value < t_62_HandedOver.valid_to) THEN x_595.value ELSE t_62_HandedOver.valid_to END ELSE t_60_HandedOver.valid_to END)) as x_597, JSON_EACH(JSON_ARRAY(((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)))) as x_598
      WHERE
        (CASE WHEN (CASE WHEN (x_596.value > t_58_HandedOver.valid_from) THEN x_596.value ELSE t_58_HandedOver.valid_from END > t_56_HandedOver.valid_from) THEN CASE WHEN (x_596.value > t_58_HandedOver.valid_from) THEN x_596.value ELSE t_58_HandedOver.valid_from END ELSE t_56_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_597.value < t_58_HandedOver.valid_to) THEN x_597.value ELSE t_58_HandedOver.valid_to END < t_56_HandedOver.valid_to) THEN CASE WHEN (x_597.value < t_58_HandedOver.valid_to) THEN x_597.value ELSE t_58_HandedOver.valid_to END ELSE t_56_HandedOver.valid_to END) AND
        (x_598.value < 10) AND
        (CASE WHEN (x_596.value > t_58_HandedOver.valid_from) THEN x_596.value ELSE t_58_HandedOver.valid_from END < CASE WHEN (x_597.value < t_58_HandedOver.valid_to) THEN x_597.value ELSE t_58_HandedOver.valid_to END) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (x_594.value > t_62_HandedOver.valid_from) THEN x_594.value ELSE t_62_HandedOver.valid_from END > t_60_HandedOver.valid_from) THEN CASE WHEN (x_594.value > t_62_HandedOver.valid_from) THEN x_594.value ELSE t_62_HandedOver.valid_from END ELSE t_60_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_595.value < t_62_HandedOver.valid_to) THEN x_595.value ELSE t_62_HandedOver.valid_to END < t_60_HandedOver.valid_to) THEN CASE WHEN (x_595.value < t_62_HandedOver.valid_to) THEN x_595.value ELSE t_62_HandedOver.valid_to END ELSE t_60_HandedOver.valid_to END) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (x_594.value > t_62_HandedOver.valid_from) THEN x_594.value ELSE t_62_HandedOver.valid_from END < CASE WHEN (x_595.value < t_62_HandedOver.valid_to) THEN x_595.value ELSE t_62_HandedOver.valid_to END) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END > t_66_HandedOver.valid_from) THEN CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END ELSE t_66_HandedOver.valid_from END > t_64_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END > t_66_HandedOver.valid_from) THEN CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END ELSE t_66_HandedOver.valid_from END ELSE t_64_HandedOver.valid_from END < CASE WHEN (CASE WHEN (CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END < t_66_HandedOver.valid_to) THEN CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END ELSE t_66_HandedOver.valid_to END < t_64_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END < t_66_HandedOver.valid_to) THEN CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END ELSE t_66_HandedOver.valid_to END ELSE t_64_HandedOver.valid_to END) AND
        (((((0) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END > t_66_HandedOver.valid_from) THEN CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END ELSE t_66_HandedOver.valid_from END < CASE WHEN (CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END < t_66_HandedOver.valid_to) THEN CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END ELSE t_66_HandedOver.valid_to END) AND
        (((0) + (1)) < 10) AND
        (CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END < CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_56_HandedOver.source IS t_58_HandedOver.target) AND
        (t_58_HandedOver.source IS t_60_HandedOver.target) AND
        (t_60_HandedOver.source IS t_62_HandedOver.target) AND
        (t_62_HandedOver.source IS t_64_HandedOver.target) AND
        (t_64_HandedOver.source IS t_66_HandedOver.target) AND
        (t_66_HandedOver.source IS t_68_HandedOver.target) AND
        (t_68_HandedOver.source IS t_70_HandedOver.target)
     UNION ALL
    
      SELECT
        t_88_HandedOver.source AS source,
        t_72_HandedOver.target AS target,
        CASE WHEN (x_736.value > t_72_HandedOver.valid_from) THEN x_736.value ELSE t_72_HandedOver.valid_from END AS valid_from,
        CASE WHEN (x_737.value < t_72_HandedOver.valid_to) THEN x_737.value ELSE t_72_HandedOver.valid_to END AS valid_to,
        ((((x_735.value) + (1))) + (1)) AS synalog_step
      FROM
        t_1_HandedOver AS t_88_HandedOver, t_1_HandedOver AS t_86_HandedOver, t_1_HandedOver AS t_84_HandedOver, t_1_HandedOver AS t_82_HandedOver, t_1_HandedOver AS t_80_HandedOver, t_1_HandedOver AS t_78_HandedOver, t_1_HandedOver AS t_76_HandedOver, t_1_HandedOver AS t_74_HandedOver, t_1_HandedOver AS t_72_HandedOver, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END > t_84_HandedOver.valid_from) THEN CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END ELSE t_84_HandedOver.valid_from END > t_82_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END > t_84_HandedOver.valid_from) THEN CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END ELSE t_84_HandedOver.valid_from END ELSE t_82_HandedOver.valid_from END)) as x_731, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END < t_84_HandedOver.valid_to) THEN CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END ELSE t_84_HandedOver.valid_to END < t_82_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END < t_84_HandedOver.valid_to) THEN CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END ELSE t_84_HandedOver.valid_to END ELSE t_82_HandedOver.valid_to END)) as x_732, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (x_731.value > t_80_HandedOver.valid_from) THEN x_731.value ELSE t_80_HandedOver.valid_from END > t_78_HandedOver.valid_from) THEN CASE WHEN (x_731.value > t_80_HandedOver.valid_from) THEN x_731.value ELSE t_80_HandedOver.valid_from END ELSE t_78_HandedOver.valid_from END)) as x_733, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (x_732.value < t_80_HandedOver.valid_to) THEN x_732.value ELSE t_80_HandedOver.valid_to END < t_78_HandedOver.valid_to) THEN CASE WHEN (x_732.value < t_80_HandedOver.valid_to) THEN x_732.value ELSE t_80_HandedOver.valid_to END ELSE t_78_HandedOver.valid_to END)) as x_734, JSON_EACH(JSON_ARRAY(((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)))) as x_735, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (x_733.value > t_76_HandedOver.valid_from) THEN x_733.value ELSE t_76_HandedOver.valid_from END > t_74_HandedOver.valid_from) THEN CASE WHEN (x_733.value > t_76_HandedOver.valid_from) THEN x_733.value ELSE t_76_HandedOver.valid_from END ELSE t_74_HandedOver.valid_from END)) as x_736, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (x_734.value < t_76_HandedOver.valid_to) THEN x_734.value ELSE t_76_HandedOver.valid_to END < t_74_HandedOver.valid_to) THEN CASE WHEN (x_734.value < t_76_HandedOver.valid_to) THEN x_734.value ELSE t_76_HandedOver.valid_to END ELSE t_74_HandedOver.valid_to END)) as x_737
      WHERE
        (CASE WHEN (x_736.value > t_72_HandedOver.valid_from) THEN x_736.value ELSE t_72_HandedOver.valid_from END < CASE WHEN (x_737.value < t_72_HandedOver.valid_to) THEN x_737.value ELSE t_72_HandedOver.valid_to END) AND
        (((x_735.value) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (x_733.value > t_76_HandedOver.valid_from) THEN x_733.value ELSE t_76_HandedOver.valid_from END > t_74_HandedOver.valid_from) THEN CASE WHEN (x_733.value > t_76_HandedOver.valid_from) THEN x_733.value ELSE t_76_HandedOver.valid_from END ELSE t_74_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_734.value < t_76_HandedOver.valid_to) THEN x_734.value ELSE t_76_HandedOver.valid_to END < t_74_HandedOver.valid_to) THEN CASE WHEN (x_734.value < t_76_HandedOver.valid_to) THEN x_734.value ELSE t_76_HandedOver.valid_to END ELSE t_74_HandedOver.valid_to END) AND
        (x_735.value < 10) AND
        (CASE WHEN (x_733.value > t_76_HandedOver.valid_from) THEN x_733.value ELSE t_76_HandedOver.valid_from END < CASE WHEN (x_734.value < t_76_HandedOver.valid_to) THEN x_734.value ELSE t_76_HandedOver.valid_to END) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (x_731.value > t_80_HandedOver.valid_from) THEN x_731.value ELSE t_80_HandedOver.valid_from END > t_78_HandedOver.valid_from) THEN CASE WHEN (x_731.value > t_80_HandedOver.valid_from) THEN x_731.value ELSE t_80_HandedOver.valid_from END ELSE t_78_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_732.value < t_80_HandedOver.valid_to) THEN x_732.value ELSE t_80_HandedOver.valid_to END < t_78_HandedOver.valid_to) THEN CASE WHEN (x_732.value < t_80_HandedOver.valid_to) THEN x_732.value ELSE t_80_HandedOver.valid_to END ELSE t_78_HandedOver.valid_to END) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (x_731.value > t_80_HandedOver.valid_from) THEN x_731.value ELSE t_80_HandedOver.valid_from END < CASE WHEN (x_732.value < t_80_HandedOver.valid_to) THEN x_732.value ELSE t_80_HandedOver.valid_to END) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END > t_84_HandedOver.valid_from) THEN CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END ELSE t_84_HandedOver.valid_from END > t_82_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END > t_84_HandedOver.valid_from) THEN CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END ELSE t_84_HandedOver.valid_from END ELSE t_82_HandedOver.valid_from END < CASE WHEN (CASE WHEN (CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END < t_84_HandedOver.valid_to) THEN CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END ELSE t_84_HandedOver.valid_to END < t_82_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END < t_84_HandedOver.valid_to) THEN CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END ELSE t_84_HandedOver.valid_to END ELSE t_82_HandedOver.valid_to END) AND
        (((((0) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END > t_84_HandedOver.valid_from) THEN CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END ELSE t_84_HandedOver.valid_from END < CASE WHEN (CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END < t_84_HandedOver.valid_to) THEN CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END ELSE t_84_HandedOver.valid_to END) AND
        (((0) + (1)) < 10) AND
        (CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END < CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_72_HandedOver.source IS t_74_HandedOver.target) AND
        (t_74_HandedOver.source IS t_76_HandedOver.target) AND
        (t_76_HandedOver.source IS t_78_HandedOver.target) AND
        (t_78_HandedOver.source IS t_80_HandedOver.target) AND
        (t_80_HandedOver.source IS t_82_HandedOver.target) AND
        (t_82_HandedOver.source IS t_84_HandedOver.target) AND
        (t_84_HandedOver.source IS t_86_HandedOver.target) AND
        (t_86_HandedOver.source IS t_88_HandedOver.target)
     UNION ALL
    
      SELECT
        t_108_HandedOver.source AS source,
        t_90_HandedOver.target AS target,
        CASE WHEN (CASE WHEN (x_888.value > t_92_HandedOver.valid_from) THEN x_888.value ELSE t_92_HandedOver.valid_from END > t_90_HandedOver.valid_from) THEN CASE WHEN (x_888.value > t_92_HandedOver.valid_from) THEN x_888.value ELSE t_92_HandedOver.valid_from END ELSE t_90_HandedOver.valid_from END AS valid_from,
        CASE WHEN (CASE WHEN (x_889.value < t_92_HandedOver.valid_to) THEN x_889.value ELSE t_92_HandedOver.valid_to END < t_90_HandedOver.valid_to) THEN CASE WHEN (x_889.value < t_92_HandedOver.valid_to) THEN x_889.value ELSE t_92_HandedOver.valid_to END ELSE t_90_HandedOver.valid_to END AS valid_to,
        ((((((x_887.value) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_HandedOver AS t_108_HandedOver, t_1_HandedOver AS t_106_HandedOver, t_1_HandedOver AS t_104_HandedOver, t_1_HandedOver AS t_102_HandedOver, t_1_HandedOver AS t_100_HandedOver, t_1_HandedOver AS t_98_HandedOver, t_1_HandedOver AS t_96_HandedOver, t_1_HandedOver AS t_94_HandedOver, t_1_HandedOver AS t_92_HandedOver, t_1_HandedOver AS t_90_HandedOver, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END > t_104_HandedOver.valid_from) THEN CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END ELSE t_104_HandedOver.valid_from END > t_102_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END > t_104_HandedOver.valid_from) THEN CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END ELSE t_104_HandedOver.valid_from END ELSE t_102_HandedOver.valid_from END)) as x_883, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END < t_104_HandedOver.valid_to) THEN CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END ELSE t_104_HandedOver.valid_to END < t_102_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END < t_104_HandedOver.valid_to) THEN CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END ELSE t_104_HandedOver.valid_to END ELSE t_102_HandedOver.valid_to END)) as x_884, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (x_883.value > t_100_HandedOver.valid_from) THEN x_883.value ELSE t_100_HandedOver.valid_from END > t_98_HandedOver.valid_from) THEN CASE WHEN (x_883.value > t_100_HandedOver.valid_from) THEN x_883.value ELSE t_100_HandedOver.valid_from END ELSE t_98_HandedOver.valid_from END)) as x_885, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (x_884.value < t_100_HandedOver.valid_to) THEN x_884.value ELSE t_100_HandedOver.valid_to END < t_98_HandedOver.valid_to) THEN CASE WHEN (x_884.value < t_100_HandedOver.valid_to) THEN x_884.value ELSE t_100_HandedOver.valid_to END ELSE t_98_HandedOver.valid_to END)) as x_886, JSON_EACH(JSON_ARRAY(((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)))) as x_887, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (x_885.value > t_96_HandedOver.valid_from) THEN x_885.value ELSE t_96_HandedOver.valid_from END > t_94_HandedOver.valid_from) THEN CASE WHEN (x_885.value > t_96_HandedOver.valid_from) THEN x_885.value ELSE t_96_HandedOver.valid_from END ELSE t_94_HandedOver.valid_from END)) as x_888, JSON_EACH(JSON_ARRAY(CASE WHEN (CASE WHEN (x_886.value < t_96_HandedOver.valid_to) THEN x_886.value ELSE t_96_HandedOver.valid_to END < t_94_HandedOver.valid_to) THEN CASE WHEN (x_886.value < t_96_HandedOver.valid_to) THEN x_886.value ELSE t_96_HandedOver.valid_to END ELSE t_94_HandedOver.valid_to END)) as x_889
      WHERE
        (CASE WHEN (CASE WHEN (x_888.value > t_92_HandedOver.valid_from) THEN x_888.value ELSE t_92_HandedOver.valid_from END > t_90_HandedOver.valid_from) THEN CASE WHEN (x_888.value > t_92_HandedOver.valid_from) THEN x_888.value ELSE t_92_HandedOver.valid_from END ELSE t_90_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_889.value < t_92_HandedOver.valid_to) THEN x_889.value ELSE t_92_HandedOver.valid_to END < t_90_HandedOver.valid_to) THEN CASE WHEN (x_889.value < t_92_HandedOver.valid_to) THEN x_889.value ELSE t_92_HandedOver.valid_to END ELSE t_90_HandedOver.valid_to END) AND
        (((((x_887.value) + (1))) + (1)) < 10) AND
        (CASE WHEN (x_888.value > t_92_HandedOver.valid_from) THEN x_888.value ELSE t_92_HandedOver.valid_from END < CASE WHEN (x_889.value < t_92_HandedOver.valid_to) THEN x_889.value ELSE t_92_HandedOver.valid_to END) AND
        (((x_887.value) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (x_885.value > t_96_HandedOver.valid_from) THEN x_885.value ELSE t_96_HandedOver.valid_from END > t_94_HandedOver.valid_from) THEN CASE WHEN (x_885.value > t_96_HandedOver.valid_from) THEN x_885.value ELSE t_96_HandedOver.valid_from END ELSE t_94_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_886.value < t_96_HandedOver.valid_to) THEN x_886.value ELSE t_96_HandedOver.valid_to END < t_94_HandedOver.valid_to) THEN CASE WHEN (x_886.value < t_96_HandedOver.valid_to) THEN x_886.value ELSE t_96_HandedOver.valid_to END ELSE t_94_HandedOver.valid_to END) AND
        (x_887.value < 10) AND
        (CASE WHEN (x_885.value > t_96_HandedOver.valid_from) THEN x_885.value ELSE t_96_HandedOver.valid_from END < CASE WHEN (x_886.value < t_96_HandedOver.valid_to) THEN x_886.value ELSE t_96_HandedOver.valid_to END) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (x_883.value > t_100_HandedOver.valid_from) THEN x_883.value ELSE t_100_HandedOver.valid_from END > t_98_HandedOver.valid_from) THEN CASE WHEN (x_883.value > t_100_HandedOver.valid_from) THEN x_883.value ELSE t_100_HandedOver.valid_from END ELSE t_98_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_884.value < t_100_HandedOver.valid_to) THEN x_884.value ELSE t_100_HandedOver.valid_to END < t_98_HandedOver.valid_to) THEN CASE WHEN (x_884.value < t_100_HandedOver.valid_to) THEN x_884.value ELSE t_100_HandedOver.valid_to END ELSE t_98_HandedOver.valid_to END) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (x_883.value > t_100_HandedOver.valid_from) THEN x_883.value ELSE t_100_HandedOver.valid_from END < CASE WHEN (x_884.value < t_100_HandedOver.valid_to) THEN x_884.value ELSE t_100_HandedOver.valid_to END) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END > t_104_HandedOver.valid_from) THEN CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END ELSE t_104_HandedOver.valid_from END > t_102_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END > t_104_HandedOver.valid_from) THEN CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END ELSE t_104_HandedOver.valid_from END ELSE t_102_HandedOver.valid_from END < CASE WHEN (CASE WHEN (CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END < t_104_HandedOver.valid_to) THEN CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END ELSE t_104_HandedOver.valid_to END < t_102_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END < t_104_HandedOver.valid_to) THEN CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END ELSE t_104_HandedOver.valid_to END ELSE t_102_HandedOver.valid_to END) AND
        (((((0) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END > t_104_HandedOver.valid_from) THEN CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END ELSE t_104_HandedOver.valid_from END < CASE WHEN (CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END < t_104_HandedOver.valid_to) THEN CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END ELSE t_104_HandedOver.valid_to END) AND
        (((0) + (1)) < 10) AND
        (CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END < CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_90_HandedOver.source IS t_92_HandedOver.target) AND
        (t_92_HandedOver.source IS t_94_HandedOver.target) AND
        (t_94_HandedOver.source IS t_96_HandedOver.target) AND
        (t_96_HandedOver.source IS t_98_HandedOver.target) AND
        (t_98_HandedOver.source IS t_100_HandedOver.target) AND
        (t_100_HandedOver.source IS t_102_HandedOver.target) AND
        (t_102_HandedOver.source IS t_104_HandedOver.target) AND
        (t_104_HandedOver.source IS t_106_HandedOver.target) AND
        (t_106_HandedOver.source IS t_108_HandedOver.target)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_109_ReachedBy_RecursiveCte.source AS source,
  t_110_HandedOver.target AS target,
  CASE WHEN (t_109_ReachedBy_RecursiveCte.valid_from > t_110_HandedOver.valid_from) THEN t_109_ReachedBy_RecursiveCte.valid_from ELSE t_110_HandedOver.valid_from END AS valid_from,
  CASE WHEN (t_109_ReachedBy_RecursiveCte.valid_to < t_110_HandedOver.valid_to) THEN t_109_ReachedBy_RecursiveCte.valid_to ELSE t_110_HandedOver.valid_to END AS valid_to,
  ((t_109_ReachedBy_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_ReachedBy_RecursiveCte AS t_109_ReachedBy_RecursiveCte, t_1_HandedOver AS t_110_HandedOver
WHERE
  (CASE WHEN (t_109_ReachedBy_RecursiveCte.valid_from > t_110_HandedOver.valid_from) THEN t_109_ReachedBy_RecursiveCte.valid_from ELSE t_110_HandedOver.valid_from END < CASE WHEN (t_109_ReachedBy_RecursiveCte.valid_to < t_110_HandedOver.valid_to) THEN t_109_ReachedBy_RecursiveCte.valid_to ELSE t_110_HandedOver.valid_to END) AND
  (t_109_ReachedBy_RecursiveCte.synalog_step < 10) AND
  (t_110_HandedOver.source IS t_109_ReachedBy_RecursiveCte.target))
SELECT
  ReachedBy_RecursiveCte.source AS source,
  ReachedBy_RecursiveCte.target AS target,
  ReachedBy_RecursiveCte.valid_from AS valid_from,
  ReachedBy_RecursiveCte.valid_to AS valid_to
FROM
  t_0_ReachedBy_RecursiveCte AS ReachedBy_RecursiveCte
GROUP BY ReachedBy_RecursiveCte.source, ReachedBy_RecursiveCte.target, ReachedBy_RecursiveCte.valid_from, ReachedBy_RecursiveCte.valid_to ORDER BY source NULLS LAST, target NULLS LAST, valid_from NULLS LAST;