WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS "from",
      2 AS "to"
   UNION ALL
  
    SELECT
      2 AS "from",
      3 AS "to"
  
) AS UNUSED_TABLE_NAME  ),
t_20_Reach_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_21_Edge."to" AS "to"
    FROM
      t_1_Edge AS t_21_Edge
    WHERE
      (t_21_Edge."from" = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_19_Reach_r0 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f1."to" AS "to"
FROM
  t_20_Reach_MultBodyAggAux_recursive_head_f1 AS Reach_MultBodyAggAux_recursive_head_f1
GROUP BY 1 ORDER BY "to"),
t_16_Reach_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_17_Edge."to" AS "to"
    FROM
      t_1_Edge AS t_17_Edge
    WHERE
      (t_17_Edge."from" = 1)
   UNION ALL
  
    SELECT
      t_18_Edge."to" AS "to"
    FROM
      t_19_Reach_r0 AS Reach_r0, t_1_Edge AS t_18_Edge
    WHERE
      (t_18_Edge."from" = Reach_r0."to")
  
) AS UNUSED_TABLE_NAME  ),
t_15_Reach_r1 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f2."to" AS "to"
FROM
  t_16_Reach_MultBodyAggAux_recursive_head_f2 AS Reach_MultBodyAggAux_recursive_head_f2
GROUP BY 1 ORDER BY "to"),
t_12_Reach_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_13_Edge."to" AS "to"
    FROM
      t_1_Edge AS t_13_Edge
    WHERE
      (t_13_Edge."from" = 1)
   UNION ALL
  
    SELECT
      t_14_Edge."to" AS "to"
    FROM
      t_15_Reach_r1 AS Reach_r1, t_1_Edge AS t_14_Edge
    WHERE
      (t_14_Edge."from" = Reach_r1."to")
  
) AS UNUSED_TABLE_NAME  ),
t_11_Reach_r2 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f3."to" AS "to"
FROM
  t_12_Reach_MultBodyAggAux_recursive_head_f3 AS Reach_MultBodyAggAux_recursive_head_f3
GROUP BY 1 ORDER BY "to"),
t_8_Reach_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_9_Edge."to" AS "to"
    FROM
      t_1_Edge AS t_9_Edge
    WHERE
      (t_9_Edge."from" = 1)
   UNION ALL
  
    SELECT
      t_10_Edge."to" AS "to"
    FROM
      t_11_Reach_r2 AS Reach_r2, t_1_Edge AS t_10_Edge
    WHERE
      (t_10_Edge."from" = Reach_r2."to")
  
) AS UNUSED_TABLE_NAME  ),
t_7_Reach_r3 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f4."to" AS "to"
FROM
  t_8_Reach_MultBodyAggAux_recursive_head_f4 AS Reach_MultBodyAggAux_recursive_head_f4
GROUP BY 1 ORDER BY "to"),
t_4_Reach_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_5_Edge."to" AS "to"
    FROM
      t_1_Edge AS t_5_Edge
    WHERE
      (t_5_Edge."from" = 1)
   UNION ALL
  
    SELECT
      t_6_Edge."to" AS "to"
    FROM
      t_7_Reach_r3 AS Reach_r3, t_1_Edge AS t_6_Edge
    WHERE
      (t_6_Edge."from" = Reach_r3."to")
  
) AS UNUSED_TABLE_NAME  ),
t_3_Reach_r4 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f5."to" AS "to"
FROM
  t_4_Reach_MultBodyAggAux_recursive_head_f5 AS Reach_MultBodyAggAux_recursive_head_f5
GROUP BY 1 ORDER BY "to"),
t_0_Reach_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      Edge."to" AS "to"
    FROM
      t_1_Edge AS Edge
    WHERE
      (Edge."from" = 1)
   UNION ALL
  
    SELECT
      t_2_Edge."to" AS "to"
    FROM
      t_3_Reach_r4 AS Reach_r4, t_1_Edge AS t_2_Edge
    WHERE
      (t_2_Edge."from" = Reach_r4."to")
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_recursive_head_f6."to" AS "to"
FROM
  t_0_Reach_MultBodyAggAux_recursive_head_f6 AS Reach_MultBodyAggAux_recursive_head_f6
GROUP BY 1 ORDER BY "to";