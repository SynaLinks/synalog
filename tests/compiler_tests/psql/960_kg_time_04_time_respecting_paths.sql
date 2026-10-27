-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
        (COALESCE(t_2_HandedOver.source, '') = COALESCE(t_4_HandedOver.target, '') AND (t_2_HandedOver.source IS NULL) = (t_4_HandedOver.target IS NULL))
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
        (COALESCE(t_6_HandedOver.source, '') = COALESCE(t_8_HandedOver.target, '') AND (t_6_HandedOver.source IS NULL) = (t_8_HandedOver.target IS NULL)) AND
        (COALESCE(t_8_HandedOver.source, '') = COALESCE(t_10_HandedOver.target, '') AND (t_8_HandedOver.source IS NULL) = (t_10_HandedOver.target IS NULL))
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
        (COALESCE(t_12_HandedOver.source, '') = COALESCE(t_14_HandedOver.target, '') AND (t_12_HandedOver.source IS NULL) = (t_14_HandedOver.target IS NULL)) AND
        (COALESCE(t_14_HandedOver.source, '') = COALESCE(t_16_HandedOver.target, '') AND (t_14_HandedOver.source IS NULL) = (t_16_HandedOver.target IS NULL)) AND
        (COALESCE(t_16_HandedOver.source, '') = COALESCE(t_18_HandedOver.target, '') AND (t_16_HandedOver.source IS NULL) = (t_18_HandedOver.target IS NULL))
     UNION ALL
    
      SELECT
        t_28_HandedOver.source AS source,
        t_20_HandedOver.target AS target,
        CASE WHEN (x_268 > t_20_HandedOver.valid_from) THEN x_268 ELSE t_20_HandedOver.valid_from END AS valid_from,
        CASE WHEN (x_269 < t_20_HandedOver.valid_to) THEN x_269 ELSE t_20_HandedOver.valid_to END AS valid_to,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_HandedOver AS t_28_HandedOver, t_1_HandedOver AS t_26_HandedOver, t_1_HandedOver AS t_24_HandedOver, t_1_HandedOver AS t_22_HandedOver, t_1_HandedOver AS t_20_HandedOver, UNNEST(ARRAY[CASE WHEN (CASE WHEN (CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END > t_24_HandedOver.valid_from) THEN CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END ELSE t_24_HandedOver.valid_from END > t_22_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END > t_24_HandedOver.valid_from) THEN CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END ELSE t_24_HandedOver.valid_from END ELSE t_22_HandedOver.valid_from END]) as x_268, UNNEST(ARRAY[CASE WHEN (CASE WHEN (CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END < t_24_HandedOver.valid_to) THEN CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END ELSE t_24_HandedOver.valid_to END < t_22_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END < t_24_HandedOver.valid_to) THEN CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END ELSE t_24_HandedOver.valid_to END ELSE t_22_HandedOver.valid_to END]) as x_269
      WHERE
        (CASE WHEN (x_268 > t_20_HandedOver.valid_from) THEN x_268 ELSE t_20_HandedOver.valid_from END < CASE WHEN (x_269 < t_20_HandedOver.valid_to) THEN x_269 ELSE t_20_HandedOver.valid_to END) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END > t_24_HandedOver.valid_from) THEN CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END ELSE t_24_HandedOver.valid_from END > t_22_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END > t_24_HandedOver.valid_from) THEN CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END ELSE t_24_HandedOver.valid_from END ELSE t_22_HandedOver.valid_from END < CASE WHEN (CASE WHEN (CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END < t_24_HandedOver.valid_to) THEN CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END ELSE t_24_HandedOver.valid_to END < t_22_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END < t_24_HandedOver.valid_to) THEN CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END ELSE t_24_HandedOver.valid_to END ELSE t_22_HandedOver.valid_to END) AND
        (((((0) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END > t_24_HandedOver.valid_from) THEN CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END ELSE t_24_HandedOver.valid_from END < CASE WHEN (CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END < t_24_HandedOver.valid_to) THEN CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END ELSE t_24_HandedOver.valid_to END) AND
        (((0) + (1)) < 10) AND
        (CASE WHEN (t_28_HandedOver.valid_from > t_26_HandedOver.valid_from) THEN t_28_HandedOver.valid_from ELSE t_26_HandedOver.valid_from END < CASE WHEN (t_28_HandedOver.valid_to < t_26_HandedOver.valid_to) THEN t_28_HandedOver.valid_to ELSE t_26_HandedOver.valid_to END) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_20_HandedOver.source, '') = COALESCE(t_22_HandedOver.target, '') AND (t_20_HandedOver.source IS NULL) = (t_22_HandedOver.target IS NULL)) AND
        (COALESCE(t_22_HandedOver.source, '') = COALESCE(t_24_HandedOver.target, '') AND (t_22_HandedOver.source IS NULL) = (t_24_HandedOver.target IS NULL)) AND
        (COALESCE(t_24_HandedOver.source, '') = COALESCE(t_26_HandedOver.target, '') AND (t_24_HandedOver.source IS NULL) = (t_26_HandedOver.target IS NULL)) AND
        (COALESCE(t_26_HandedOver.source, '') = COALESCE(t_28_HandedOver.target, '') AND (t_26_HandedOver.source IS NULL) = (t_28_HandedOver.target IS NULL))
     UNION ALL
    
      SELECT
        t_40_HandedOver.source AS source,
        t_30_HandedOver.target AS target,
        CASE WHEN (CASE WHEN (x_363 > t_32_HandedOver.valid_from) THEN x_363 ELSE t_32_HandedOver.valid_from END > t_30_HandedOver.valid_from) THEN CASE WHEN (x_363 > t_32_HandedOver.valid_from) THEN x_363 ELSE t_32_HandedOver.valid_from END ELSE t_30_HandedOver.valid_from END AS valid_from,
        CASE WHEN (CASE WHEN (x_364 < t_32_HandedOver.valid_to) THEN x_364 ELSE t_32_HandedOver.valid_to END < t_30_HandedOver.valid_to) THEN CASE WHEN (x_364 < t_32_HandedOver.valid_to) THEN x_364 ELSE t_32_HandedOver.valid_to END ELSE t_30_HandedOver.valid_to END AS valid_to,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_HandedOver AS t_40_HandedOver, t_1_HandedOver AS t_38_HandedOver, t_1_HandedOver AS t_36_HandedOver, t_1_HandedOver AS t_34_HandedOver, t_1_HandedOver AS t_32_HandedOver, t_1_HandedOver AS t_30_HandedOver, UNNEST(ARRAY[CASE WHEN (CASE WHEN (CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END > t_36_HandedOver.valid_from) THEN CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END ELSE t_36_HandedOver.valid_from END > t_34_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END > t_36_HandedOver.valid_from) THEN CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END ELSE t_36_HandedOver.valid_from END ELSE t_34_HandedOver.valid_from END]) as x_363, UNNEST(ARRAY[CASE WHEN (CASE WHEN (CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END < t_36_HandedOver.valid_to) THEN CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END ELSE t_36_HandedOver.valid_to END < t_34_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END < t_36_HandedOver.valid_to) THEN CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END ELSE t_36_HandedOver.valid_to END ELSE t_34_HandedOver.valid_to END]) as x_364
      WHERE
        (CASE WHEN (CASE WHEN (x_363 > t_32_HandedOver.valid_from) THEN x_363 ELSE t_32_HandedOver.valid_from END > t_30_HandedOver.valid_from) THEN CASE WHEN (x_363 > t_32_HandedOver.valid_from) THEN x_363 ELSE t_32_HandedOver.valid_from END ELSE t_30_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_364 < t_32_HandedOver.valid_to) THEN x_364 ELSE t_32_HandedOver.valid_to END < t_30_HandedOver.valid_to) THEN CASE WHEN (x_364 < t_32_HandedOver.valid_to) THEN x_364 ELSE t_32_HandedOver.valid_to END ELSE t_30_HandedOver.valid_to END) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (x_363 > t_32_HandedOver.valid_from) THEN x_363 ELSE t_32_HandedOver.valid_from END < CASE WHEN (x_364 < t_32_HandedOver.valid_to) THEN x_364 ELSE t_32_HandedOver.valid_to END) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END > t_36_HandedOver.valid_from) THEN CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END ELSE t_36_HandedOver.valid_from END > t_34_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END > t_36_HandedOver.valid_from) THEN CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END ELSE t_36_HandedOver.valid_from END ELSE t_34_HandedOver.valid_from END < CASE WHEN (CASE WHEN (CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END < t_36_HandedOver.valid_to) THEN CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END ELSE t_36_HandedOver.valid_to END < t_34_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END < t_36_HandedOver.valid_to) THEN CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END ELSE t_36_HandedOver.valid_to END ELSE t_34_HandedOver.valid_to END) AND
        (((((0) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END > t_36_HandedOver.valid_from) THEN CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END ELSE t_36_HandedOver.valid_from END < CASE WHEN (CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END < t_36_HandedOver.valid_to) THEN CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END ELSE t_36_HandedOver.valid_to END) AND
        (((0) + (1)) < 10) AND
        (CASE WHEN (t_40_HandedOver.valid_from > t_38_HandedOver.valid_from) THEN t_40_HandedOver.valid_from ELSE t_38_HandedOver.valid_from END < CASE WHEN (t_40_HandedOver.valid_to < t_38_HandedOver.valid_to) THEN t_40_HandedOver.valid_to ELSE t_38_HandedOver.valid_to END) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_30_HandedOver.source, '') = COALESCE(t_32_HandedOver.target, '') AND (t_30_HandedOver.source IS NULL) = (t_32_HandedOver.target IS NULL)) AND
        (COALESCE(t_32_HandedOver.source, '') = COALESCE(t_34_HandedOver.target, '') AND (t_32_HandedOver.source IS NULL) = (t_34_HandedOver.target IS NULL)) AND
        (COALESCE(t_34_HandedOver.source, '') = COALESCE(t_36_HandedOver.target, '') AND (t_34_HandedOver.source IS NULL) = (t_36_HandedOver.target IS NULL)) AND
        (COALESCE(t_36_HandedOver.source, '') = COALESCE(t_38_HandedOver.target, '') AND (t_36_HandedOver.source IS NULL) = (t_38_HandedOver.target IS NULL)) AND
        (COALESCE(t_38_HandedOver.source, '') = COALESCE(t_40_HandedOver.target, '') AND (t_38_HandedOver.source IS NULL) = (t_40_HandedOver.target IS NULL))
     UNION ALL
    
      SELECT
        t_54_HandedOver.source AS source,
        t_42_HandedOver.target AS target,
        CASE WHEN (x_473 > t_42_HandedOver.valid_from) THEN x_473 ELSE t_42_HandedOver.valid_from END AS valid_from,
        CASE WHEN (x_474 < t_42_HandedOver.valid_to) THEN x_474 ELSE t_42_HandedOver.valid_to END AS valid_to,
        ((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_HandedOver AS t_54_HandedOver, t_1_HandedOver AS t_52_HandedOver, t_1_HandedOver AS t_50_HandedOver, t_1_HandedOver AS t_48_HandedOver, t_1_HandedOver AS t_46_HandedOver, t_1_HandedOver AS t_44_HandedOver, t_1_HandedOver AS t_42_HandedOver, UNNEST(ARRAY[CASE WHEN (CASE WHEN (CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END > t_50_HandedOver.valid_from) THEN CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END ELSE t_50_HandedOver.valid_from END > t_48_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END > t_50_HandedOver.valid_from) THEN CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END ELSE t_50_HandedOver.valid_from END ELSE t_48_HandedOver.valid_from END]) as x_471, UNNEST(ARRAY[CASE WHEN (CASE WHEN (CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END < t_50_HandedOver.valid_to) THEN CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END ELSE t_50_HandedOver.valid_to END < t_48_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END < t_50_HandedOver.valid_to) THEN CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END ELSE t_50_HandedOver.valid_to END ELSE t_48_HandedOver.valid_to END]) as x_472, UNNEST(ARRAY[CASE WHEN (CASE WHEN (x_471 > t_46_HandedOver.valid_from) THEN x_471 ELSE t_46_HandedOver.valid_from END > t_44_HandedOver.valid_from) THEN CASE WHEN (x_471 > t_46_HandedOver.valid_from) THEN x_471 ELSE t_46_HandedOver.valid_from END ELSE t_44_HandedOver.valid_from END]) as x_473, UNNEST(ARRAY[CASE WHEN (CASE WHEN (x_472 < t_46_HandedOver.valid_to) THEN x_472 ELSE t_46_HandedOver.valid_to END < t_44_HandedOver.valid_to) THEN CASE WHEN (x_472 < t_46_HandedOver.valid_to) THEN x_472 ELSE t_46_HandedOver.valid_to END ELSE t_44_HandedOver.valid_to END]) as x_474
      WHERE
        (CASE WHEN (x_473 > t_42_HandedOver.valid_from) THEN x_473 ELSE t_42_HandedOver.valid_from END < CASE WHEN (x_474 < t_42_HandedOver.valid_to) THEN x_474 ELSE t_42_HandedOver.valid_to END) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (x_471 > t_46_HandedOver.valid_from) THEN x_471 ELSE t_46_HandedOver.valid_from END > t_44_HandedOver.valid_from) THEN CASE WHEN (x_471 > t_46_HandedOver.valid_from) THEN x_471 ELSE t_46_HandedOver.valid_from END ELSE t_44_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_472 < t_46_HandedOver.valid_to) THEN x_472 ELSE t_46_HandedOver.valid_to END < t_44_HandedOver.valid_to) THEN CASE WHEN (x_472 < t_46_HandedOver.valid_to) THEN x_472 ELSE t_46_HandedOver.valid_to END ELSE t_44_HandedOver.valid_to END) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (x_471 > t_46_HandedOver.valid_from) THEN x_471 ELSE t_46_HandedOver.valid_from END < CASE WHEN (x_472 < t_46_HandedOver.valid_to) THEN x_472 ELSE t_46_HandedOver.valid_to END) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END > t_50_HandedOver.valid_from) THEN CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END ELSE t_50_HandedOver.valid_from END > t_48_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END > t_50_HandedOver.valid_from) THEN CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END ELSE t_50_HandedOver.valid_from END ELSE t_48_HandedOver.valid_from END < CASE WHEN (CASE WHEN (CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END < t_50_HandedOver.valid_to) THEN CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END ELSE t_50_HandedOver.valid_to END < t_48_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END < t_50_HandedOver.valid_to) THEN CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END ELSE t_50_HandedOver.valid_to END ELSE t_48_HandedOver.valid_to END) AND
        (((((0) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END > t_50_HandedOver.valid_from) THEN CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END ELSE t_50_HandedOver.valid_from END < CASE WHEN (CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END < t_50_HandedOver.valid_to) THEN CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END ELSE t_50_HandedOver.valid_to END) AND
        (((0) + (1)) < 10) AND
        (CASE WHEN (t_54_HandedOver.valid_from > t_52_HandedOver.valid_from) THEN t_54_HandedOver.valid_from ELSE t_52_HandedOver.valid_from END < CASE WHEN (t_54_HandedOver.valid_to < t_52_HandedOver.valid_to) THEN t_54_HandedOver.valid_to ELSE t_52_HandedOver.valid_to END) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_42_HandedOver.source, '') = COALESCE(t_44_HandedOver.target, '') AND (t_42_HandedOver.source IS NULL) = (t_44_HandedOver.target IS NULL)) AND
        (COALESCE(t_44_HandedOver.source, '') = COALESCE(t_46_HandedOver.target, '') AND (t_44_HandedOver.source IS NULL) = (t_46_HandedOver.target IS NULL)) AND
        (COALESCE(t_46_HandedOver.source, '') = COALESCE(t_48_HandedOver.target, '') AND (t_46_HandedOver.source IS NULL) = (t_48_HandedOver.target IS NULL)) AND
        (COALESCE(t_48_HandedOver.source, '') = COALESCE(t_50_HandedOver.target, '') AND (t_48_HandedOver.source IS NULL) = (t_50_HandedOver.target IS NULL)) AND
        (COALESCE(t_50_HandedOver.source, '') = COALESCE(t_52_HandedOver.target, '') AND (t_50_HandedOver.source IS NULL) = (t_52_HandedOver.target IS NULL)) AND
        (COALESCE(t_52_HandedOver.source, '') = COALESCE(t_54_HandedOver.target, '') AND (t_52_HandedOver.source IS NULL) = (t_54_HandedOver.target IS NULL))
     UNION ALL
    
      SELECT
        t_70_HandedOver.source AS source,
        t_56_HandedOver.target AS target,
        CASE WHEN (CASE WHEN (x_596 > t_58_HandedOver.valid_from) THEN x_596 ELSE t_58_HandedOver.valid_from END > t_56_HandedOver.valid_from) THEN CASE WHEN (x_596 > t_58_HandedOver.valid_from) THEN x_596 ELSE t_58_HandedOver.valid_from END ELSE t_56_HandedOver.valid_from END AS valid_from,
        CASE WHEN (CASE WHEN (x_597 < t_58_HandedOver.valid_to) THEN x_597 ELSE t_58_HandedOver.valid_to END < t_56_HandedOver.valid_to) THEN CASE WHEN (x_597 < t_58_HandedOver.valid_to) THEN x_597 ELSE t_58_HandedOver.valid_to END ELSE t_56_HandedOver.valid_to END AS valid_to,
        ((x_598) + (1)) AS synalog_step
      FROM
        t_1_HandedOver AS t_70_HandedOver, t_1_HandedOver AS t_68_HandedOver, t_1_HandedOver AS t_66_HandedOver, t_1_HandedOver AS t_64_HandedOver, t_1_HandedOver AS t_62_HandedOver, t_1_HandedOver AS t_60_HandedOver, t_1_HandedOver AS t_58_HandedOver, t_1_HandedOver AS t_56_HandedOver, UNNEST(ARRAY[CASE WHEN (CASE WHEN (CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END > t_66_HandedOver.valid_from) THEN CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END ELSE t_66_HandedOver.valid_from END > t_64_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END > t_66_HandedOver.valid_from) THEN CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END ELSE t_66_HandedOver.valid_from END ELSE t_64_HandedOver.valid_from END]) as x_594, UNNEST(ARRAY[CASE WHEN (CASE WHEN (CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END < t_66_HandedOver.valid_to) THEN CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END ELSE t_66_HandedOver.valid_to END < t_64_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END < t_66_HandedOver.valid_to) THEN CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END ELSE t_66_HandedOver.valid_to END ELSE t_64_HandedOver.valid_to END]) as x_595, UNNEST(ARRAY[CASE WHEN (CASE WHEN (x_594 > t_62_HandedOver.valid_from) THEN x_594 ELSE t_62_HandedOver.valid_from END > t_60_HandedOver.valid_from) THEN CASE WHEN (x_594 > t_62_HandedOver.valid_from) THEN x_594 ELSE t_62_HandedOver.valid_from END ELSE t_60_HandedOver.valid_from END]) as x_596, UNNEST(ARRAY[CASE WHEN (CASE WHEN (x_595 < t_62_HandedOver.valid_to) THEN x_595 ELSE t_62_HandedOver.valid_to END < t_60_HandedOver.valid_to) THEN CASE WHEN (x_595 < t_62_HandedOver.valid_to) THEN x_595 ELSE t_62_HandedOver.valid_to END ELSE t_60_HandedOver.valid_to END]) as x_597, UNNEST(ARRAY[((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1))]) as x_598
      WHERE
        (CASE WHEN (CASE WHEN (x_596 > t_58_HandedOver.valid_from) THEN x_596 ELSE t_58_HandedOver.valid_from END > t_56_HandedOver.valid_from) THEN CASE WHEN (x_596 > t_58_HandedOver.valid_from) THEN x_596 ELSE t_58_HandedOver.valid_from END ELSE t_56_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_597 < t_58_HandedOver.valid_to) THEN x_597 ELSE t_58_HandedOver.valid_to END < t_56_HandedOver.valid_to) THEN CASE WHEN (x_597 < t_58_HandedOver.valid_to) THEN x_597 ELSE t_58_HandedOver.valid_to END ELSE t_56_HandedOver.valid_to END) AND
        (x_598 < 10) AND
        (CASE WHEN (x_596 > t_58_HandedOver.valid_from) THEN x_596 ELSE t_58_HandedOver.valid_from END < CASE WHEN (x_597 < t_58_HandedOver.valid_to) THEN x_597 ELSE t_58_HandedOver.valid_to END) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (x_594 > t_62_HandedOver.valid_from) THEN x_594 ELSE t_62_HandedOver.valid_from END > t_60_HandedOver.valid_from) THEN CASE WHEN (x_594 > t_62_HandedOver.valid_from) THEN x_594 ELSE t_62_HandedOver.valid_from END ELSE t_60_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_595 < t_62_HandedOver.valid_to) THEN x_595 ELSE t_62_HandedOver.valid_to END < t_60_HandedOver.valid_to) THEN CASE WHEN (x_595 < t_62_HandedOver.valid_to) THEN x_595 ELSE t_62_HandedOver.valid_to END ELSE t_60_HandedOver.valid_to END) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (x_594 > t_62_HandedOver.valid_from) THEN x_594 ELSE t_62_HandedOver.valid_from END < CASE WHEN (x_595 < t_62_HandedOver.valid_to) THEN x_595 ELSE t_62_HandedOver.valid_to END) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END > t_66_HandedOver.valid_from) THEN CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END ELSE t_66_HandedOver.valid_from END > t_64_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END > t_66_HandedOver.valid_from) THEN CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END ELSE t_66_HandedOver.valid_from END ELSE t_64_HandedOver.valid_from END < CASE WHEN (CASE WHEN (CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END < t_66_HandedOver.valid_to) THEN CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END ELSE t_66_HandedOver.valid_to END < t_64_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END < t_66_HandedOver.valid_to) THEN CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END ELSE t_66_HandedOver.valid_to END ELSE t_64_HandedOver.valid_to END) AND
        (((((0) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END > t_66_HandedOver.valid_from) THEN CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END ELSE t_66_HandedOver.valid_from END < CASE WHEN (CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END < t_66_HandedOver.valid_to) THEN CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END ELSE t_66_HandedOver.valid_to END) AND
        (((0) + (1)) < 10) AND
        (CASE WHEN (t_70_HandedOver.valid_from > t_68_HandedOver.valid_from) THEN t_70_HandedOver.valid_from ELSE t_68_HandedOver.valid_from END < CASE WHEN (t_70_HandedOver.valid_to < t_68_HandedOver.valid_to) THEN t_70_HandedOver.valid_to ELSE t_68_HandedOver.valid_to END) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_56_HandedOver.source, '') = COALESCE(t_58_HandedOver.target, '') AND (t_56_HandedOver.source IS NULL) = (t_58_HandedOver.target IS NULL)) AND
        (COALESCE(t_58_HandedOver.source, '') = COALESCE(t_60_HandedOver.target, '') AND (t_58_HandedOver.source IS NULL) = (t_60_HandedOver.target IS NULL)) AND
        (COALESCE(t_60_HandedOver.source, '') = COALESCE(t_62_HandedOver.target, '') AND (t_60_HandedOver.source IS NULL) = (t_62_HandedOver.target IS NULL)) AND
        (COALESCE(t_62_HandedOver.source, '') = COALESCE(t_64_HandedOver.target, '') AND (t_62_HandedOver.source IS NULL) = (t_64_HandedOver.target IS NULL)) AND
        (COALESCE(t_64_HandedOver.source, '') = COALESCE(t_66_HandedOver.target, '') AND (t_64_HandedOver.source IS NULL) = (t_66_HandedOver.target IS NULL)) AND
        (COALESCE(t_66_HandedOver.source, '') = COALESCE(t_68_HandedOver.target, '') AND (t_66_HandedOver.source IS NULL) = (t_68_HandedOver.target IS NULL)) AND
        (COALESCE(t_68_HandedOver.source, '') = COALESCE(t_70_HandedOver.target, '') AND (t_68_HandedOver.source IS NULL) = (t_70_HandedOver.target IS NULL))
     UNION ALL
    
      SELECT
        t_88_HandedOver.source AS source,
        t_72_HandedOver.target AS target,
        CASE WHEN (x_736 > t_72_HandedOver.valid_from) THEN x_736 ELSE t_72_HandedOver.valid_from END AS valid_from,
        CASE WHEN (x_737 < t_72_HandedOver.valid_to) THEN x_737 ELSE t_72_HandedOver.valid_to END AS valid_to,
        ((((x_735) + (1))) + (1)) AS synalog_step
      FROM
        t_1_HandedOver AS t_88_HandedOver, t_1_HandedOver AS t_86_HandedOver, t_1_HandedOver AS t_84_HandedOver, t_1_HandedOver AS t_82_HandedOver, t_1_HandedOver AS t_80_HandedOver, t_1_HandedOver AS t_78_HandedOver, t_1_HandedOver AS t_76_HandedOver, t_1_HandedOver AS t_74_HandedOver, t_1_HandedOver AS t_72_HandedOver, UNNEST(ARRAY[CASE WHEN (CASE WHEN (CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END > t_84_HandedOver.valid_from) THEN CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END ELSE t_84_HandedOver.valid_from END > t_82_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END > t_84_HandedOver.valid_from) THEN CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END ELSE t_84_HandedOver.valid_from END ELSE t_82_HandedOver.valid_from END]) as x_731, UNNEST(ARRAY[CASE WHEN (CASE WHEN (CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END < t_84_HandedOver.valid_to) THEN CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END ELSE t_84_HandedOver.valid_to END < t_82_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END < t_84_HandedOver.valid_to) THEN CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END ELSE t_84_HandedOver.valid_to END ELSE t_82_HandedOver.valid_to END]) as x_732, UNNEST(ARRAY[CASE WHEN (CASE WHEN (x_731 > t_80_HandedOver.valid_from) THEN x_731 ELSE t_80_HandedOver.valid_from END > t_78_HandedOver.valid_from) THEN CASE WHEN (x_731 > t_80_HandedOver.valid_from) THEN x_731 ELSE t_80_HandedOver.valid_from END ELSE t_78_HandedOver.valid_from END]) as x_733, UNNEST(ARRAY[CASE WHEN (CASE WHEN (x_732 < t_80_HandedOver.valid_to) THEN x_732 ELSE t_80_HandedOver.valid_to END < t_78_HandedOver.valid_to) THEN CASE WHEN (x_732 < t_80_HandedOver.valid_to) THEN x_732 ELSE t_80_HandedOver.valid_to END ELSE t_78_HandedOver.valid_to END]) as x_734, UNNEST(ARRAY[((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1))]) as x_735, UNNEST(ARRAY[CASE WHEN (CASE WHEN (x_733 > t_76_HandedOver.valid_from) THEN x_733 ELSE t_76_HandedOver.valid_from END > t_74_HandedOver.valid_from) THEN CASE WHEN (x_733 > t_76_HandedOver.valid_from) THEN x_733 ELSE t_76_HandedOver.valid_from END ELSE t_74_HandedOver.valid_from END]) as x_736, UNNEST(ARRAY[CASE WHEN (CASE WHEN (x_734 < t_76_HandedOver.valid_to) THEN x_734 ELSE t_76_HandedOver.valid_to END < t_74_HandedOver.valid_to) THEN CASE WHEN (x_734 < t_76_HandedOver.valid_to) THEN x_734 ELSE t_76_HandedOver.valid_to END ELSE t_74_HandedOver.valid_to END]) as x_737
      WHERE
        (CASE WHEN (x_736 > t_72_HandedOver.valid_from) THEN x_736 ELSE t_72_HandedOver.valid_from END < CASE WHEN (x_737 < t_72_HandedOver.valid_to) THEN x_737 ELSE t_72_HandedOver.valid_to END) AND
        (((x_735) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (x_733 > t_76_HandedOver.valid_from) THEN x_733 ELSE t_76_HandedOver.valid_from END > t_74_HandedOver.valid_from) THEN CASE WHEN (x_733 > t_76_HandedOver.valid_from) THEN x_733 ELSE t_76_HandedOver.valid_from END ELSE t_74_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_734 < t_76_HandedOver.valid_to) THEN x_734 ELSE t_76_HandedOver.valid_to END < t_74_HandedOver.valid_to) THEN CASE WHEN (x_734 < t_76_HandedOver.valid_to) THEN x_734 ELSE t_76_HandedOver.valid_to END ELSE t_74_HandedOver.valid_to END) AND
        (x_735 < 10) AND
        (CASE WHEN (x_733 > t_76_HandedOver.valid_from) THEN x_733 ELSE t_76_HandedOver.valid_from END < CASE WHEN (x_734 < t_76_HandedOver.valid_to) THEN x_734 ELSE t_76_HandedOver.valid_to END) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (x_731 > t_80_HandedOver.valid_from) THEN x_731 ELSE t_80_HandedOver.valid_from END > t_78_HandedOver.valid_from) THEN CASE WHEN (x_731 > t_80_HandedOver.valid_from) THEN x_731 ELSE t_80_HandedOver.valid_from END ELSE t_78_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_732 < t_80_HandedOver.valid_to) THEN x_732 ELSE t_80_HandedOver.valid_to END < t_78_HandedOver.valid_to) THEN CASE WHEN (x_732 < t_80_HandedOver.valid_to) THEN x_732 ELSE t_80_HandedOver.valid_to END ELSE t_78_HandedOver.valid_to END) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (x_731 > t_80_HandedOver.valid_from) THEN x_731 ELSE t_80_HandedOver.valid_from END < CASE WHEN (x_732 < t_80_HandedOver.valid_to) THEN x_732 ELSE t_80_HandedOver.valid_to END) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END > t_84_HandedOver.valid_from) THEN CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END ELSE t_84_HandedOver.valid_from END > t_82_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END > t_84_HandedOver.valid_from) THEN CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END ELSE t_84_HandedOver.valid_from END ELSE t_82_HandedOver.valid_from END < CASE WHEN (CASE WHEN (CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END < t_84_HandedOver.valid_to) THEN CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END ELSE t_84_HandedOver.valid_to END < t_82_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END < t_84_HandedOver.valid_to) THEN CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END ELSE t_84_HandedOver.valid_to END ELSE t_82_HandedOver.valid_to END) AND
        (((((0) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END > t_84_HandedOver.valid_from) THEN CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END ELSE t_84_HandedOver.valid_from END < CASE WHEN (CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END < t_84_HandedOver.valid_to) THEN CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END ELSE t_84_HandedOver.valid_to END) AND
        (((0) + (1)) < 10) AND
        (CASE WHEN (t_88_HandedOver.valid_from > t_86_HandedOver.valid_from) THEN t_88_HandedOver.valid_from ELSE t_86_HandedOver.valid_from END < CASE WHEN (t_88_HandedOver.valid_to < t_86_HandedOver.valid_to) THEN t_88_HandedOver.valid_to ELSE t_86_HandedOver.valid_to END) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_72_HandedOver.source, '') = COALESCE(t_74_HandedOver.target, '') AND (t_72_HandedOver.source IS NULL) = (t_74_HandedOver.target IS NULL)) AND
        (COALESCE(t_74_HandedOver.source, '') = COALESCE(t_76_HandedOver.target, '') AND (t_74_HandedOver.source IS NULL) = (t_76_HandedOver.target IS NULL)) AND
        (COALESCE(t_76_HandedOver.source, '') = COALESCE(t_78_HandedOver.target, '') AND (t_76_HandedOver.source IS NULL) = (t_78_HandedOver.target IS NULL)) AND
        (COALESCE(t_78_HandedOver.source, '') = COALESCE(t_80_HandedOver.target, '') AND (t_78_HandedOver.source IS NULL) = (t_80_HandedOver.target IS NULL)) AND
        (COALESCE(t_80_HandedOver.source, '') = COALESCE(t_82_HandedOver.target, '') AND (t_80_HandedOver.source IS NULL) = (t_82_HandedOver.target IS NULL)) AND
        (COALESCE(t_82_HandedOver.source, '') = COALESCE(t_84_HandedOver.target, '') AND (t_82_HandedOver.source IS NULL) = (t_84_HandedOver.target IS NULL)) AND
        (COALESCE(t_84_HandedOver.source, '') = COALESCE(t_86_HandedOver.target, '') AND (t_84_HandedOver.source IS NULL) = (t_86_HandedOver.target IS NULL)) AND
        (COALESCE(t_86_HandedOver.source, '') = COALESCE(t_88_HandedOver.target, '') AND (t_86_HandedOver.source IS NULL) = (t_88_HandedOver.target IS NULL))
     UNION ALL
    
      SELECT
        t_108_HandedOver.source AS source,
        t_90_HandedOver.target AS target,
        CASE WHEN (CASE WHEN (x_888 > t_92_HandedOver.valid_from) THEN x_888 ELSE t_92_HandedOver.valid_from END > t_90_HandedOver.valid_from) THEN CASE WHEN (x_888 > t_92_HandedOver.valid_from) THEN x_888 ELSE t_92_HandedOver.valid_from END ELSE t_90_HandedOver.valid_from END AS valid_from,
        CASE WHEN (CASE WHEN (x_889 < t_92_HandedOver.valid_to) THEN x_889 ELSE t_92_HandedOver.valid_to END < t_90_HandedOver.valid_to) THEN CASE WHEN (x_889 < t_92_HandedOver.valid_to) THEN x_889 ELSE t_92_HandedOver.valid_to END ELSE t_90_HandedOver.valid_to END AS valid_to,
        ((((((x_887) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_HandedOver AS t_108_HandedOver, t_1_HandedOver AS t_106_HandedOver, t_1_HandedOver AS t_104_HandedOver, t_1_HandedOver AS t_102_HandedOver, t_1_HandedOver AS t_100_HandedOver, t_1_HandedOver AS t_98_HandedOver, t_1_HandedOver AS t_96_HandedOver, t_1_HandedOver AS t_94_HandedOver, t_1_HandedOver AS t_92_HandedOver, t_1_HandedOver AS t_90_HandedOver, UNNEST(ARRAY[CASE WHEN (CASE WHEN (CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END > t_104_HandedOver.valid_from) THEN CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END ELSE t_104_HandedOver.valid_from END > t_102_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END > t_104_HandedOver.valid_from) THEN CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END ELSE t_104_HandedOver.valid_from END ELSE t_102_HandedOver.valid_from END]) as x_883, UNNEST(ARRAY[CASE WHEN (CASE WHEN (CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END < t_104_HandedOver.valid_to) THEN CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END ELSE t_104_HandedOver.valid_to END < t_102_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END < t_104_HandedOver.valid_to) THEN CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END ELSE t_104_HandedOver.valid_to END ELSE t_102_HandedOver.valid_to END]) as x_884, UNNEST(ARRAY[CASE WHEN (CASE WHEN (x_883 > t_100_HandedOver.valid_from) THEN x_883 ELSE t_100_HandedOver.valid_from END > t_98_HandedOver.valid_from) THEN CASE WHEN (x_883 > t_100_HandedOver.valid_from) THEN x_883 ELSE t_100_HandedOver.valid_from END ELSE t_98_HandedOver.valid_from END]) as x_885, UNNEST(ARRAY[CASE WHEN (CASE WHEN (x_884 < t_100_HandedOver.valid_to) THEN x_884 ELSE t_100_HandedOver.valid_to END < t_98_HandedOver.valid_to) THEN CASE WHEN (x_884 < t_100_HandedOver.valid_to) THEN x_884 ELSE t_100_HandedOver.valid_to END ELSE t_98_HandedOver.valid_to END]) as x_886, UNNEST(ARRAY[((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1))]) as x_887, UNNEST(ARRAY[CASE WHEN (CASE WHEN (x_885 > t_96_HandedOver.valid_from) THEN x_885 ELSE t_96_HandedOver.valid_from END > t_94_HandedOver.valid_from) THEN CASE WHEN (x_885 > t_96_HandedOver.valid_from) THEN x_885 ELSE t_96_HandedOver.valid_from END ELSE t_94_HandedOver.valid_from END]) as x_888, UNNEST(ARRAY[CASE WHEN (CASE WHEN (x_886 < t_96_HandedOver.valid_to) THEN x_886 ELSE t_96_HandedOver.valid_to END < t_94_HandedOver.valid_to) THEN CASE WHEN (x_886 < t_96_HandedOver.valid_to) THEN x_886 ELSE t_96_HandedOver.valid_to END ELSE t_94_HandedOver.valid_to END]) as x_889
      WHERE
        (CASE WHEN (CASE WHEN (x_888 > t_92_HandedOver.valid_from) THEN x_888 ELSE t_92_HandedOver.valid_from END > t_90_HandedOver.valid_from) THEN CASE WHEN (x_888 > t_92_HandedOver.valid_from) THEN x_888 ELSE t_92_HandedOver.valid_from END ELSE t_90_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_889 < t_92_HandedOver.valid_to) THEN x_889 ELSE t_92_HandedOver.valid_to END < t_90_HandedOver.valid_to) THEN CASE WHEN (x_889 < t_92_HandedOver.valid_to) THEN x_889 ELSE t_92_HandedOver.valid_to END ELSE t_90_HandedOver.valid_to END) AND
        (((((x_887) + (1))) + (1)) < 10) AND
        (CASE WHEN (x_888 > t_92_HandedOver.valid_from) THEN x_888 ELSE t_92_HandedOver.valid_from END < CASE WHEN (x_889 < t_92_HandedOver.valid_to) THEN x_889 ELSE t_92_HandedOver.valid_to END) AND
        (((x_887) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (x_885 > t_96_HandedOver.valid_from) THEN x_885 ELSE t_96_HandedOver.valid_from END > t_94_HandedOver.valid_from) THEN CASE WHEN (x_885 > t_96_HandedOver.valid_from) THEN x_885 ELSE t_96_HandedOver.valid_from END ELSE t_94_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_886 < t_96_HandedOver.valid_to) THEN x_886 ELSE t_96_HandedOver.valid_to END < t_94_HandedOver.valid_to) THEN CASE WHEN (x_886 < t_96_HandedOver.valid_to) THEN x_886 ELSE t_96_HandedOver.valid_to END ELSE t_94_HandedOver.valid_to END) AND
        (x_887 < 10) AND
        (CASE WHEN (x_885 > t_96_HandedOver.valid_from) THEN x_885 ELSE t_96_HandedOver.valid_from END < CASE WHEN (x_886 < t_96_HandedOver.valid_to) THEN x_886 ELSE t_96_HandedOver.valid_to END) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (x_883 > t_100_HandedOver.valid_from) THEN x_883 ELSE t_100_HandedOver.valid_from END > t_98_HandedOver.valid_from) THEN CASE WHEN (x_883 > t_100_HandedOver.valid_from) THEN x_883 ELSE t_100_HandedOver.valid_from END ELSE t_98_HandedOver.valid_from END < CASE WHEN (CASE WHEN (x_884 < t_100_HandedOver.valid_to) THEN x_884 ELSE t_100_HandedOver.valid_to END < t_98_HandedOver.valid_to) THEN CASE WHEN (x_884 < t_100_HandedOver.valid_to) THEN x_884 ELSE t_100_HandedOver.valid_to END ELSE t_98_HandedOver.valid_to END) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (x_883 > t_100_HandedOver.valid_from) THEN x_883 ELSE t_100_HandedOver.valid_from END < CASE WHEN (x_884 < t_100_HandedOver.valid_to) THEN x_884 ELSE t_100_HandedOver.valid_to END) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END > t_104_HandedOver.valid_from) THEN CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END ELSE t_104_HandedOver.valid_from END > t_102_HandedOver.valid_from) THEN CASE WHEN (CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END > t_104_HandedOver.valid_from) THEN CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END ELSE t_104_HandedOver.valid_from END ELSE t_102_HandedOver.valid_from END < CASE WHEN (CASE WHEN (CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END < t_104_HandedOver.valid_to) THEN CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END ELSE t_104_HandedOver.valid_to END < t_102_HandedOver.valid_to) THEN CASE WHEN (CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END < t_104_HandedOver.valid_to) THEN CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END ELSE t_104_HandedOver.valid_to END ELSE t_102_HandedOver.valid_to END) AND
        (((((0) + (1))) + (1)) < 10) AND
        (CASE WHEN (CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END > t_104_HandedOver.valid_from) THEN CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END ELSE t_104_HandedOver.valid_from END < CASE WHEN (CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END < t_104_HandedOver.valid_to) THEN CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END ELSE t_104_HandedOver.valid_to END) AND
        (((0) + (1)) < 10) AND
        (CASE WHEN (t_108_HandedOver.valid_from > t_106_HandedOver.valid_from) THEN t_108_HandedOver.valid_from ELSE t_106_HandedOver.valid_from END < CASE WHEN (t_108_HandedOver.valid_to < t_106_HandedOver.valid_to) THEN t_108_HandedOver.valid_to ELSE t_106_HandedOver.valid_to END) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_90_HandedOver.source, '') = COALESCE(t_92_HandedOver.target, '') AND (t_90_HandedOver.source IS NULL) = (t_92_HandedOver.target IS NULL)) AND
        (COALESCE(t_92_HandedOver.source, '') = COALESCE(t_94_HandedOver.target, '') AND (t_92_HandedOver.source IS NULL) = (t_94_HandedOver.target IS NULL)) AND
        (COALESCE(t_94_HandedOver.source, '') = COALESCE(t_96_HandedOver.target, '') AND (t_94_HandedOver.source IS NULL) = (t_96_HandedOver.target IS NULL)) AND
        (COALESCE(t_96_HandedOver.source, '') = COALESCE(t_98_HandedOver.target, '') AND (t_96_HandedOver.source IS NULL) = (t_98_HandedOver.target IS NULL)) AND
        (COALESCE(t_98_HandedOver.source, '') = COALESCE(t_100_HandedOver.target, '') AND (t_98_HandedOver.source IS NULL) = (t_100_HandedOver.target IS NULL)) AND
        (COALESCE(t_100_HandedOver.source, '') = COALESCE(t_102_HandedOver.target, '') AND (t_100_HandedOver.source IS NULL) = (t_102_HandedOver.target IS NULL)) AND
        (COALESCE(t_102_HandedOver.source, '') = COALESCE(t_104_HandedOver.target, '') AND (t_102_HandedOver.source IS NULL) = (t_104_HandedOver.target IS NULL)) AND
        (COALESCE(t_104_HandedOver.source, '') = COALESCE(t_106_HandedOver.target, '') AND (t_104_HandedOver.source IS NULL) = (t_106_HandedOver.target IS NULL)) AND
        (COALESCE(t_106_HandedOver.source, '') = COALESCE(t_108_HandedOver.target, '') AND (t_106_HandedOver.source IS NULL) = (t_108_HandedOver.target IS NULL))
    
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
  (COALESCE(t_110_HandedOver.source, '') = COALESCE(t_109_ReachedBy_RecursiveCte.target, '') AND (t_110_HandedOver.source IS NULL) = (t_109_ReachedBy_RecursiveCte.target IS NULL)))
SELECT
  ReachedBy_RecursiveCte.source AS source,
  ReachedBy_RecursiveCte.target AS target,
  ReachedBy_RecursiveCte.valid_from AS valid_from,
  ReachedBy_RecursiveCte.valid_to AS valid_to
FROM
  t_0_ReachedBy_RecursiveCte AS ReachedBy_RecursiveCte
GROUP BY ReachedBy_RecursiveCte.source, ReachedBy_RecursiveCte.target, ReachedBy_RecursiveCte.valid_from, ReachedBy_RecursiveCte.valid_to ORDER BY source, target, valid_from;