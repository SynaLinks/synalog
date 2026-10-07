WITH t_2_Influenced AS (SELECT * FROM (
  
    SELECT
      "austen" AS a,
      "tolkien" AS b
   UNION ALL
  
    SELECT
      "tolkien" AS a,
      "herbert" AS b
   UNION ALL
  
    SELECT
      "herbert" AS a,
      "gibson" AS b
   UNION ALL
  
    SELECT
      "asimov" AS a,
      "herbert" AS b
  
) AS UNUSED_TABLE_NAME  ),
t_25_Down_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_26_Influenced.a AS a,
      t_26_Influenced.b AS b
    FROM
      t_2_Influenced AS t_26_Influenced
  
) AS UNUSED_TABLE_NAME  ),
t_24_Down_r0 AS (SELECT
  Down_MultBodyAggAux_recursive_head_f1.a AS a,
  Down_MultBodyAggAux_recursive_head_f1.b AS b
FROM
  t_25_Down_MultBodyAggAux_recursive_head_f1 AS Down_MultBodyAggAux_recursive_head_f1
GROUP BY a, b),
t_21_Down_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_22_Influenced.a AS a,
      t_22_Influenced.b AS b
    FROM
      t_2_Influenced AS t_22_Influenced
   UNION ALL
  
    SELECT
      Down_r0.a AS a,
      t_23_Influenced.b AS b
    FROM
      t_24_Down_r0 AS Down_r0, t_2_Influenced AS t_23_Influenced
    WHERE
      (t_23_Influenced.a = Down_r0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_20_Down_r1 AS (SELECT
  Down_MultBodyAggAux_recursive_head_f2.a AS a,
  Down_MultBodyAggAux_recursive_head_f2.b AS b
FROM
  t_21_Down_MultBodyAggAux_recursive_head_f2 AS Down_MultBodyAggAux_recursive_head_f2
GROUP BY a, b),
t_17_Down_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_18_Influenced.a AS a,
      t_18_Influenced.b AS b
    FROM
      t_2_Influenced AS t_18_Influenced
   UNION ALL
  
    SELECT
      Down_r1.a AS a,
      t_19_Influenced.b AS b
    FROM
      t_20_Down_r1 AS Down_r1, t_2_Influenced AS t_19_Influenced
    WHERE
      (t_19_Influenced.a = Down_r1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_16_Down_r2 AS (SELECT
  Down_MultBodyAggAux_recursive_head_f3.a AS a,
  Down_MultBodyAggAux_recursive_head_f3.b AS b
FROM
  t_17_Down_MultBodyAggAux_recursive_head_f3 AS Down_MultBodyAggAux_recursive_head_f3
GROUP BY a, b),
t_13_Down_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_14_Influenced.a AS a,
      t_14_Influenced.b AS b
    FROM
      t_2_Influenced AS t_14_Influenced
   UNION ALL
  
    SELECT
      Down_r2.a AS a,
      t_15_Influenced.b AS b
    FROM
      t_16_Down_r2 AS Down_r2, t_2_Influenced AS t_15_Influenced
    WHERE
      (t_15_Influenced.a = Down_r2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_12_Down_r3 AS (SELECT
  Down_MultBodyAggAux_recursive_head_f4.a AS a,
  Down_MultBodyAggAux_recursive_head_f4.b AS b
FROM
  t_13_Down_MultBodyAggAux_recursive_head_f4 AS Down_MultBodyAggAux_recursive_head_f4
GROUP BY a, b),
t_9_Down_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_10_Influenced.a AS a,
      t_10_Influenced.b AS b
    FROM
      t_2_Influenced AS t_10_Influenced
   UNION ALL
  
    SELECT
      Down_r3.a AS a,
      t_11_Influenced.b AS b
    FROM
      t_12_Down_r3 AS Down_r3, t_2_Influenced AS t_11_Influenced
    WHERE
      (t_11_Influenced.a = Down_r3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_8_Down_r4 AS (SELECT
  Down_MultBodyAggAux_recursive_head_f5.a AS a,
  Down_MultBodyAggAux_recursive_head_f5.b AS b
FROM
  t_9_Down_MultBodyAggAux_recursive_head_f5 AS Down_MultBodyAggAux_recursive_head_f5
GROUP BY a, b),
t_5_Down_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_6_Influenced.a AS a,
      t_6_Influenced.b AS b
    FROM
      t_2_Influenced AS t_6_Influenced
   UNION ALL
  
    SELECT
      Down_r4.a AS a,
      t_7_Influenced.b AS b
    FROM
      t_8_Down_r4 AS Down_r4, t_2_Influenced AS t_7_Influenced
    WHERE
      (t_7_Influenced.a = Down_r4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_4_Down_r5 AS (SELECT
  Down_MultBodyAggAux_recursive_head_f6.a AS a,
  Down_MultBodyAggAux_recursive_head_f6.b AS b
FROM
  t_5_Down_MultBodyAggAux_recursive_head_f6 AS Down_MultBodyAggAux_recursive_head_f6
GROUP BY a, b),
t_1_Down_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      Influenced.a AS a,
      Influenced.b AS b
    FROM
      t_2_Influenced AS Influenced
   UNION ALL
  
    SELECT
      Down_r5.a AS a,
      t_3_Influenced.b AS b
    FROM
      t_4_Down_r5 AS Down_r5, t_2_Influenced AS t_3_Influenced
    WHERE
      (t_3_Influenced.a = Down_r5.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down AS (SELECT
  Down_MultBodyAggAux_recursive_head_f7.a AS a,
  Down_MultBodyAggAux_recursive_head_f7.b AS b
FROM
  t_1_Down_MultBodyAggAux_recursive_head_f7 AS Down_MultBodyAggAux_recursive_head_f7
GROUP BY a, b)
SELECT
  Down.a AS a,
  SUM(1) AS n
FROM
  t_0_Down AS Down
GROUP BY a ORDER BY a, n;