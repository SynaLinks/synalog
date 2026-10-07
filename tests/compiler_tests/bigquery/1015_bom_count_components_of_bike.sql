WITH t_21_Uses AS (SELECT * FROM (
  
    SELECT
      "bike" AS part,
      "frame" AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      "bike" AS part,
      "wheel" AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      "wheel" AS part,
      "rim" AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      "wheel" AS part,
      "spoke" AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      "wheel" AS part,
      "hub" AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      "hub" AS part,
      "bearing" AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      "frame" AS part,
      "tube" AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      "scooter" AS part,
      "wheel" AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      "scooter" AS part,
      "deck" AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_18_Contains_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_20_Uses.part AS part,
      t_20_Uses.component AS component
    FROM
      t_21_Uses AS t_20_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_17_Contains_r0 AS (SELECT
  Contains_MultBodyAggAux_recursive_head_f1.part AS part,
  Contains_MultBodyAggAux_recursive_head_f1.component AS component
FROM
  t_18_Contains_MultBodyAggAux_recursive_head_f1 AS Contains_MultBodyAggAux_recursive_head_f1
GROUP BY part, component),
t_15_Contains_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      Contains_r0.part AS part,
      t_16_Uses.component AS component
    FROM
      t_17_Contains_r0 AS Contains_r0, t_21_Uses AS t_16_Uses
    WHERE
      (t_16_Uses.part = Contains_r0.component)
   UNION ALL
  
    SELECT
      t_22_Uses.part AS part,
      t_22_Uses.component AS component
    FROM
      t_21_Uses AS t_22_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_14_Contains_r1 AS (SELECT
  Contains_MultBodyAggAux_recursive_head_f2.part AS part,
  Contains_MultBodyAggAux_recursive_head_f2.component AS component
FROM
  t_15_Contains_MultBodyAggAux_recursive_head_f2 AS Contains_MultBodyAggAux_recursive_head_f2
GROUP BY part, component),
t_12_Contains_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      Contains_r1.part AS part,
      t_13_Uses.component AS component
    FROM
      t_14_Contains_r1 AS Contains_r1, t_21_Uses AS t_13_Uses
    WHERE
      (t_13_Uses.part = Contains_r1.component)
   UNION ALL
  
    SELECT
      t_23_Uses.part AS part,
      t_23_Uses.component AS component
    FROM
      t_21_Uses AS t_23_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_11_Contains_r2 AS (SELECT
  Contains_MultBodyAggAux_recursive_head_f3.part AS part,
  Contains_MultBodyAggAux_recursive_head_f3.component AS component
FROM
  t_12_Contains_MultBodyAggAux_recursive_head_f3 AS Contains_MultBodyAggAux_recursive_head_f3
GROUP BY part, component),
t_9_Contains_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      Contains_r2.part AS part,
      t_10_Uses.component AS component
    FROM
      t_11_Contains_r2 AS Contains_r2, t_21_Uses AS t_10_Uses
    WHERE
      (t_10_Uses.part = Contains_r2.component)
   UNION ALL
  
    SELECT
      t_24_Uses.part AS part,
      t_24_Uses.component AS component
    FROM
      t_21_Uses AS t_24_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_8_Contains_r3 AS (SELECT
  Contains_MultBodyAggAux_recursive_head_f4.part AS part,
  Contains_MultBodyAggAux_recursive_head_f4.component AS component
FROM
  t_9_Contains_MultBodyAggAux_recursive_head_f4 AS Contains_MultBodyAggAux_recursive_head_f4
GROUP BY part, component),
t_6_Contains_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      Contains_r3.part AS part,
      t_7_Uses.component AS component
    FROM
      t_8_Contains_r3 AS Contains_r3, t_21_Uses AS t_7_Uses
    WHERE
      (t_7_Uses.part = Contains_r3.component)
   UNION ALL
  
    SELECT
      t_25_Uses.part AS part,
      t_25_Uses.component AS component
    FROM
      t_21_Uses AS t_25_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_5_Contains_r4 AS (SELECT
  Contains_MultBodyAggAux_recursive_head_f5.part AS part,
  Contains_MultBodyAggAux_recursive_head_f5.component AS component
FROM
  t_6_Contains_MultBodyAggAux_recursive_head_f5 AS Contains_MultBodyAggAux_recursive_head_f5
GROUP BY part, component),
t_3_Contains_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      Contains_r4.part AS part,
      t_4_Uses.component AS component
    FROM
      t_5_Contains_r4 AS Contains_r4, t_21_Uses AS t_4_Uses
    WHERE
      (t_4_Uses.part = Contains_r4.component)
   UNION ALL
  
    SELECT
      t_26_Uses.part AS part,
      t_26_Uses.component AS component
    FROM
      t_21_Uses AS t_26_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_2_Contains_r5 AS (SELECT
  Contains_MultBodyAggAux_recursive_head_f6.part AS part,
  Contains_MultBodyAggAux_recursive_head_f6.component AS component
FROM
  t_3_Contains_MultBodyAggAux_recursive_head_f6 AS Contains_MultBodyAggAux_recursive_head_f6
GROUP BY part, component),
t_1_Contains_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      Contains_r5.part AS part,
      Uses.component AS component
    FROM
      t_2_Contains_r5 AS Contains_r5, t_21_Uses AS Uses
    WHERE
      (Uses.part = Contains_r5.component)
   UNION ALL
  
    SELECT
      t_27_Uses.part AS part,
      t_27_Uses.component AS component
    FROM
      t_21_Uses AS t_27_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_0_Contains AS (SELECT
  Contains_MultBodyAggAux_recursive_head_f7.part AS part,
  Contains_MultBodyAggAux_recursive_head_f7.component AS component
FROM
  t_1_Contains_MultBodyAggAux_recursive_head_f7 AS Contains_MultBodyAggAux_recursive_head_f7
GROUP BY part, component)
SELECT
  SUM(1) AS n
FROM
  t_0_Contains AS Contains
WHERE
  (Contains.part = "bike");