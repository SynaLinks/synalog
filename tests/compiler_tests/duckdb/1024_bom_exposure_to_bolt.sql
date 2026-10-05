-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_Product AS (SELECT * FROM (
  
    SELECT
      'bike' AS part
   UNION ALL
  
    SELECT
      'scooter' AS part
  
) AS UNUSED_TABLE_NAME  ),
t_22_Uses AS (SELECT * FROM (
  
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
t_19_Contains_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_21_Uses.part AS part,
      t_21_Uses.component AS component
    FROM
      t_22_Uses AS t_21_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_18_Contains_r0 AS (SELECT
  Contains_MultBodyAggAux_recursive_head_f1.part AS part,
  Contains_MultBodyAggAux_recursive_head_f1.component AS component
FROM
  t_19_Contains_MultBodyAggAux_recursive_head_f1 AS Contains_MultBodyAggAux_recursive_head_f1
GROUP BY Contains_MultBodyAggAux_recursive_head_f1.part, Contains_MultBodyAggAux_recursive_head_f1.component),
t_16_Contains_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      Contains_r0.part AS part,
      t_17_Uses.component AS component
    FROM
      t_18_Contains_r0 AS Contains_r0, t_22_Uses AS t_17_Uses
    WHERE
      (t_17_Uses.part = Contains_r0.component)
   UNION ALL
  
    SELECT
      t_23_Uses.part AS part,
      t_23_Uses.component AS component
    FROM
      t_22_Uses AS t_23_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_15_Contains_r1 AS (SELECT
  Contains_MultBodyAggAux_recursive_head_f2.part AS part,
  Contains_MultBodyAggAux_recursive_head_f2.component AS component
FROM
  t_16_Contains_MultBodyAggAux_recursive_head_f2 AS Contains_MultBodyAggAux_recursive_head_f2
GROUP BY Contains_MultBodyAggAux_recursive_head_f2.part, Contains_MultBodyAggAux_recursive_head_f2.component),
t_13_Contains_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      Contains_r1.part AS part,
      t_14_Uses.component AS component
    FROM
      t_15_Contains_r1 AS Contains_r1, t_22_Uses AS t_14_Uses
    WHERE
      (t_14_Uses.part = Contains_r1.component)
   UNION ALL
  
    SELECT
      t_24_Uses.part AS part,
      t_24_Uses.component AS component
    FROM
      t_22_Uses AS t_24_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_12_Contains_r2 AS (SELECT
  Contains_MultBodyAggAux_recursive_head_f3.part AS part,
  Contains_MultBodyAggAux_recursive_head_f3.component AS component
FROM
  t_13_Contains_MultBodyAggAux_recursive_head_f3 AS Contains_MultBodyAggAux_recursive_head_f3
GROUP BY Contains_MultBodyAggAux_recursive_head_f3.part, Contains_MultBodyAggAux_recursive_head_f3.component),
t_10_Contains_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      Contains_r2.part AS part,
      t_11_Uses.component AS component
    FROM
      t_12_Contains_r2 AS Contains_r2, t_22_Uses AS t_11_Uses
    WHERE
      (t_11_Uses.part = Contains_r2.component)
   UNION ALL
  
    SELECT
      t_25_Uses.part AS part,
      t_25_Uses.component AS component
    FROM
      t_22_Uses AS t_25_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_9_Contains_r3 AS (SELECT
  Contains_MultBodyAggAux_recursive_head_f4.part AS part,
  Contains_MultBodyAggAux_recursive_head_f4.component AS component
FROM
  t_10_Contains_MultBodyAggAux_recursive_head_f4 AS Contains_MultBodyAggAux_recursive_head_f4
GROUP BY Contains_MultBodyAggAux_recursive_head_f4.part, Contains_MultBodyAggAux_recursive_head_f4.component),
t_7_Contains_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      Contains_r3.part AS part,
      t_8_Uses.component AS component
    FROM
      t_9_Contains_r3 AS Contains_r3, t_22_Uses AS t_8_Uses
    WHERE
      (t_8_Uses.part = Contains_r3.component)
   UNION ALL
  
    SELECT
      t_26_Uses.part AS part,
      t_26_Uses.component AS component
    FROM
      t_22_Uses AS t_26_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_6_Contains_r4 AS (SELECT
  Contains_MultBodyAggAux_recursive_head_f5.part AS part,
  Contains_MultBodyAggAux_recursive_head_f5.component AS component
FROM
  t_7_Contains_MultBodyAggAux_recursive_head_f5 AS Contains_MultBodyAggAux_recursive_head_f5
GROUP BY Contains_MultBodyAggAux_recursive_head_f5.part, Contains_MultBodyAggAux_recursive_head_f5.component),
t_4_Contains_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      Contains_r4.part AS part,
      t_5_Uses.component AS component
    FROM
      t_6_Contains_r4 AS Contains_r4, t_22_Uses AS t_5_Uses
    WHERE
      (t_5_Uses.part = Contains_r4.component)
   UNION ALL
  
    SELECT
      t_27_Uses.part AS part,
      t_27_Uses.component AS component
    FROM
      t_22_Uses AS t_27_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_3_Contains_r5 AS (SELECT
  Contains_MultBodyAggAux_recursive_head_f6.part AS part,
  Contains_MultBodyAggAux_recursive_head_f6.component AS component
FROM
  t_4_Contains_MultBodyAggAux_recursive_head_f6 AS Contains_MultBodyAggAux_recursive_head_f6
GROUP BY Contains_MultBodyAggAux_recursive_head_f6.part, Contains_MultBodyAggAux_recursive_head_f6.component),
t_2_Contains_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      Contains_r5.part AS part,
      Uses.component AS component
    FROM
      t_3_Contains_r5 AS Contains_r5, t_22_Uses AS Uses
    WHERE
      (Uses.part = Contains_r5.component)
   UNION ALL
  
    SELECT
      t_28_Uses.part AS part,
      t_28_Uses.component AS component
    FROM
      t_22_Uses AS t_28_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_1_Contains AS (SELECT
  Contains_MultBodyAggAux_recursive_head_f7.part AS part,
  Contains_MultBodyAggAux_recursive_head_f7.component AS component
FROM
  t_2_Contains_MultBodyAggAux_recursive_head_f7 AS Contains_MultBodyAggAux_recursive_head_f7
GROUP BY Contains_MultBodyAggAux_recursive_head_f7.part, Contains_MultBodyAggAux_recursive_head_f7.component),
t_29_Supplies AS (SELECT * FROM (
  
    SELECT
      'rim' AS component,
      'acme' AS supplier
   UNION ALL
  
    SELECT
      'spoke' AS component,
      'acme' AS supplier
   UNION ALL
  
    SELECT
      'bearing' AS component,
      'bolt' AS supplier
   UNION ALL
  
    SELECT
      'tube' AS component,
      'steelco' AS supplier
   UNION ALL
  
    SELECT
      'deck' AS component,
      'steelco' AS supplier
   UNION ALL
  
    SELECT
      'hub' AS component,
      'bolt' AS supplier
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Product.part AS part
FROM
  t_0_Product AS Product, t_1_Contains AS Contains, t_29_Supplies AS Supplies
WHERE
  (Contains.part = Product.part) AND
  (Supplies.component = Contains.component) AND
  (Supplies.supplier = 'bolt')
GROUP BY Product.part ORDER BY part;