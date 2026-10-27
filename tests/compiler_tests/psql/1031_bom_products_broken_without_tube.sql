-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
        (COALESCE(t_4_Uses.part, '') = COALESCE(t_6_Uses.component, '') AND (t_4_Uses.part IS NULL) = (t_6_Uses.component IS NULL))
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
        (COALESCE(t_8_Uses.part, '') = COALESCE(t_10_Uses.component, '') AND (t_8_Uses.part IS NULL) = (t_10_Uses.component IS NULL)) AND
        (COALESCE(t_10_Uses.part, '') = COALESCE(t_12_Uses.component, '') AND (t_10_Uses.part IS NULL) = (t_12_Uses.component IS NULL))
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
        (COALESCE(t_14_Uses.part, '') = COALESCE(t_16_Uses.component, '') AND (t_14_Uses.part IS NULL) = (t_16_Uses.component IS NULL)) AND
        (COALESCE(t_16_Uses.part, '') = COALESCE(t_18_Uses.component, '') AND (t_16_Uses.part IS NULL) = (t_18_Uses.component IS NULL)) AND
        (COALESCE(t_18_Uses.part, '') = COALESCE(t_20_Uses.component, '') AND (t_18_Uses.part IS NULL) = (t_20_Uses.component IS NULL))
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
        (COALESCE(t_22_Uses.part, '') = COALESCE(t_24_Uses.component, '') AND (t_22_Uses.part IS NULL) = (t_24_Uses.component IS NULL)) AND
        (COALESCE(t_24_Uses.part, '') = COALESCE(t_26_Uses.component, '') AND (t_24_Uses.part IS NULL) = (t_26_Uses.component IS NULL)) AND
        (COALESCE(t_26_Uses.part, '') = COALESCE(t_28_Uses.component, '') AND (t_26_Uses.part IS NULL) = (t_28_Uses.component IS NULL)) AND
        (COALESCE(t_28_Uses.part, '') = COALESCE(t_30_Uses.component, '') AND (t_28_Uses.part IS NULL) = (t_30_Uses.component IS NULL))
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
        (COALESCE(t_32_Uses.part, '') = COALESCE(t_34_Uses.component, '') AND (t_32_Uses.part IS NULL) = (t_34_Uses.component IS NULL)) AND
        (COALESCE(t_34_Uses.part, '') = COALESCE(t_36_Uses.component, '') AND (t_34_Uses.part IS NULL) = (t_36_Uses.component IS NULL)) AND
        (COALESCE(t_36_Uses.part, '') = COALESCE(t_38_Uses.component, '') AND (t_36_Uses.part IS NULL) = (t_38_Uses.component IS NULL)) AND
        (COALESCE(t_38_Uses.part, '') = COALESCE(t_40_Uses.component, '') AND (t_38_Uses.part IS NULL) = (t_40_Uses.component IS NULL)) AND
        (COALESCE(t_40_Uses.part, '') = COALESCE(t_42_Uses.component, '') AND (t_40_Uses.part IS NULL) = (t_42_Uses.component IS NULL))
    
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
  (COALESCE(t_44_Uses.part, '') = COALESCE(t_43_Contains_RecursiveCte.component, '') AND (t_44_Uses.part IS NULL) = (t_43_Contains_RecursiveCte.component IS NULL))),
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
  (COALESCE(Contains.part, '') = COALESCE(Product.part, '') AND (Contains.part IS NULL) = (Product.part IS NULL)) AND
  (Contains.component = 'tube')
GROUP BY Product.part ORDER BY part;