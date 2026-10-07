WITH t_23_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_22_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_23_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY x),
t_25_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_20_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_21_E.b AS x
    FROM
      t_22_R_r0 AS R_r0, t_25_E AS t_21_E
    WHERE
      (t_21_E.a = R_r0.x)
  
) AS UNUSED_TABLE_NAME  ),
t_19_R_r1 AS (SELECT
  R_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_20_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY x),
t_17_R_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_18_E.b AS x
    FROM
      t_19_R_r1 AS R_r1, t_25_E AS t_18_E
    WHERE
      (t_18_E.a = R_r1.x)
  
) AS UNUSED_TABLE_NAME  ),
t_16_R_r2 AS (SELECT
  R_MultBodyAggAux_recursive_head_f3.x AS x
FROM
  t_17_R_MultBodyAggAux_recursive_head_f3 AS R_MultBodyAggAux_recursive_head_f3
GROUP BY x),
t_14_R_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_15_E.b AS x
    FROM
      t_16_R_r2 AS R_r2, t_25_E AS t_15_E
    WHERE
      (t_15_E.a = R_r2.x)
  
) AS UNUSED_TABLE_NAME  ),
t_13_R_r3 AS (SELECT
  R_MultBodyAggAux_recursive_head_f4.x AS x
FROM
  t_14_R_MultBodyAggAux_recursive_head_f4 AS R_MultBodyAggAux_recursive_head_f4
GROUP BY x),
t_11_R_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_12_E.b AS x
    FROM
      t_13_R_r3 AS R_r3, t_25_E AS t_12_E
    WHERE
      (t_12_E.a = R_r3.x)
  
) AS UNUSED_TABLE_NAME  ),
t_10_R_r4 AS (SELECT
  R_MultBodyAggAux_recursive_head_f5.x AS x
FROM
  t_11_R_MultBodyAggAux_recursive_head_f5 AS R_MultBodyAggAux_recursive_head_f5
GROUP BY x),
t_8_R_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_9_E.b AS x
    FROM
      t_10_R_r4 AS R_r4, t_25_E AS t_9_E
    WHERE
      (t_9_E.a = R_r4.x)
  
) AS UNUSED_TABLE_NAME  ),
t_7_R_r5 AS (SELECT
  R_MultBodyAggAux_recursive_head_f6.x AS x
FROM
  t_8_R_MultBodyAggAux_recursive_head_f6 AS R_MultBodyAggAux_recursive_head_f6
GROUP BY x),
t_5_R_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_6_E.b AS x
    FROM
      t_7_R_r5 AS R_r5, t_25_E AS t_6_E
    WHERE
      (t_6_E.a = R_r5.x)
  
) AS UNUSED_TABLE_NAME  ),
t_4_R_r6 AS (SELECT
  R_MultBodyAggAux_recursive_head_f7.x AS x
FROM
  t_5_R_MultBodyAggAux_recursive_head_f7 AS R_MultBodyAggAux_recursive_head_f7
GROUP BY x),
t_2_R_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_3_E.b AS x
    FROM
      t_4_R_r6 AS R_r6, t_25_E AS t_3_E
    WHERE
      (t_3_E.a = R_r6.x)
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_r7 AS (SELECT
  R_MultBodyAggAux_recursive_head_f8.x AS x
FROM
  t_2_R_MultBodyAggAux_recursive_head_f8 AS R_MultBodyAggAux_recursive_head_f8
GROUP BY x),
t_0_R_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      t_1_R_r7 AS R_r7, t_25_E AS E
    WHERE
      (E.a = R_r7.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_recursive_head_f9.x AS x
FROM
  t_0_R_MultBodyAggAux_recursive_head_f9 AS R_MultBodyAggAux_recursive_head_f9
GROUP BY x ORDER BY x NULLS LAST;