WITH t_14_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      "a" AS n
  
) AS UNUSED_TABLE_NAME  ),
t_13_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.n AS n
FROM
  t_14_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY n),
t_16_E AS (SELECT * FROM (
  
    SELECT
      "a" AS a,
      "b" AS b
   UNION ALL
  
    SELECT
      "b" AS a,
      "c" AS b
   UNION ALL
  
    SELECT
      "x" AS a,
      "y" AS b
  
) AS UNUSED_TABLE_NAME  ),
t_11_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      "a" AS n
   UNION ALL
  
    SELECT
      t_12_E.b AS n
    FROM
      t_13_R_r0 AS R_r0, t_16_E AS t_12_E
    WHERE
      (t_12_E.a = R_r0.n)
  
) AS UNUSED_TABLE_NAME  ),
t_10_R_r1 AS (SELECT
  R_MultBodyAggAux_recursive_head_f2.n AS n
FROM
  t_11_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY n),
t_8_R_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      "a" AS n
   UNION ALL
  
    SELECT
      t_9_E.b AS n
    FROM
      t_10_R_r1 AS R_r1, t_16_E AS t_9_E
    WHERE
      (t_9_E.a = R_r1.n)
  
) AS UNUSED_TABLE_NAME  ),
t_7_R_r2 AS (SELECT
  R_MultBodyAggAux_recursive_head_f3.n AS n
FROM
  t_8_R_MultBodyAggAux_recursive_head_f3 AS R_MultBodyAggAux_recursive_head_f3
GROUP BY n),
t_5_R_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      "a" AS n
   UNION ALL
  
    SELECT
      t_6_E.b AS n
    FROM
      t_7_R_r2 AS R_r2, t_16_E AS t_6_E
    WHERE
      (t_6_E.a = R_r2.n)
  
) AS UNUSED_TABLE_NAME  ),
t_4_R_r3 AS (SELECT
  R_MultBodyAggAux_recursive_head_f4.n AS n
FROM
  t_5_R_MultBodyAggAux_recursive_head_f4 AS R_MultBodyAggAux_recursive_head_f4
GROUP BY n),
t_2_R_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      "a" AS n
   UNION ALL
  
    SELECT
      t_3_E.b AS n
    FROM
      t_4_R_r3 AS R_r3, t_16_E AS t_3_E
    WHERE
      (t_3_E.a = R_r3.n)
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_r4 AS (SELECT
  R_MultBodyAggAux_recursive_head_f5.n AS n
FROM
  t_2_R_MultBodyAggAux_recursive_head_f5 AS R_MultBodyAggAux_recursive_head_f5
GROUP BY n),
t_0_R_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      "a" AS n
   UNION ALL
  
    SELECT
      E.b AS n
    FROM
      t_1_R_r4 AS R_r4, t_16_E AS E
    WHERE
      (E.a = R_r4.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_recursive_head_f6.n AS n
FROM
  t_0_R_MultBodyAggAux_recursive_head_f6 AS R_MultBodyAggAux_recursive_head_f6
GROUP BY n ORDER BY n NULLS LAST;