WITH RECURSIVE t_0_Product AS (SELECT * FROM (
  
    SELECT
      'bike' AS part
   UNION ALL
  
    SELECT
      'scooter' AS part
  
) AS UNUSED_TABLE_NAME  ),
t_3_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_2_Contains_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Uses.part AS part,
        Uses.component AS component,
        0 AS synalog_step
      FROM
        t_3_Uses AS Uses
     UNION ALL
    
      SELECT
        t_6_Uses.part AS part,
        t_4_Uses.component AS component,
        ((0) + (1)) AS synalog_step
      FROM
        t_3_Uses AS t_6_Uses, t_3_Uses AS t_4_Uses
      WHERE
        (0 < 6) AND
        (1 = 0) AND
        (t_4_Uses.part IS t_6_Uses.component)
     UNION ALL
    
      SELECT
        t_12_Uses.part AS part,
        t_8_Uses.component AS component,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Uses AS t_12_Uses, t_3_Uses AS t_10_Uses, t_3_Uses AS t_8_Uses
      WHERE
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_8_Uses.part IS t_10_Uses.component) AND
        (t_10_Uses.part IS t_12_Uses.component)
     UNION ALL
    
      SELECT
        t_20_Uses.part AS part,
        t_14_Uses.component AS component,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Uses AS t_20_Uses, t_3_Uses AS t_18_Uses, t_3_Uses AS t_16_Uses, t_3_Uses AS t_14_Uses
      WHERE
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_14_Uses.part IS t_16_Uses.component) AND
        (t_16_Uses.part IS t_18_Uses.component) AND
        (t_18_Uses.part IS t_20_Uses.component)
     UNION ALL
    
      SELECT
        t_30_Uses.part AS part,
        t_22_Uses.component AS component,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Uses AS t_30_Uses, t_3_Uses AS t_28_Uses, t_3_Uses AS t_26_Uses, t_3_Uses AS t_24_Uses, t_3_Uses AS t_22_Uses
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_22_Uses.part IS t_24_Uses.component) AND
        (t_24_Uses.part IS t_26_Uses.component) AND
        (t_26_Uses.part IS t_28_Uses.component) AND
        (t_28_Uses.part IS t_30_Uses.component)
     UNION ALL
    
      SELECT
        t_42_Uses.part AS part,
        t_32_Uses.component AS component,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Uses AS t_42_Uses, t_3_Uses AS t_40_Uses, t_3_Uses AS t_38_Uses, t_3_Uses AS t_36_Uses, t_3_Uses AS t_34_Uses, t_3_Uses AS t_32_Uses
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_32_Uses.part IS t_34_Uses.component) AND
        (t_34_Uses.part IS t_36_Uses.component) AND
        (t_36_Uses.part IS t_38_Uses.component) AND
        (t_38_Uses.part IS t_40_Uses.component) AND
        (t_40_Uses.part IS t_42_Uses.component)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_43_Contains_RecursiveCte.part AS part,
  t_44_Uses.component AS component,
  ((t_43_Contains_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_2_Contains_RecursiveCte AS t_43_Contains_RecursiveCte, t_3_Uses AS t_44_Uses
WHERE
  (t_43_Contains_RecursiveCte.synalog_step < 6) AND
  (t_44_Uses.part IS t_43_Contains_RecursiveCte.component)),
t_1_Contains AS (SELECT
  Contains_RecursiveCte.part AS part,
  Contains_RecursiveCte.component AS component
FROM
  t_2_Contains_RecursiveCte AS Contains_RecursiveCte
GROUP BY Contains_RecursiveCte.part, Contains_RecursiveCte.component)
SELECT
  Product.part AS part
FROM
  t_0_Product AS Product, t_1_Contains AS Contains
WHERE
  (Contains.part IS Product.part) AND
  (Contains.component = 'spoke')
GROUP BY Product.part ORDER BY part NULLS LAST;