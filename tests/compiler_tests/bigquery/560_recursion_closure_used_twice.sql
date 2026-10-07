WITH t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_22_P_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_23_E.a AS a,
      t_23_E.b AS b
    FROM
      t_3_E AS t_23_E
  
) AS UNUSED_TABLE_NAME  ),
t_21_P_r0 AS (SELECT
  P_MultBodyAggAux_recursive_head_f1.a AS a,
  P_MultBodyAggAux_recursive_head_f1.b AS b
FROM
  t_22_P_MultBodyAggAux_recursive_head_f1 AS P_MultBodyAggAux_recursive_head_f1
GROUP BY a, b),
t_18_P_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_19_E.a AS a,
      t_19_E.b AS b
    FROM
      t_3_E AS t_19_E
   UNION ALL
  
    SELECT
      P_r0.a AS a,
      t_20_E.b AS b
    FROM
      t_21_P_r0 AS P_r0, t_3_E AS t_20_E
    WHERE
      (t_20_E.a = P_r0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_17_P_r1 AS (SELECT
  P_MultBodyAggAux_recursive_head_f2.a AS a,
  P_MultBodyAggAux_recursive_head_f2.b AS b
FROM
  t_18_P_MultBodyAggAux_recursive_head_f2 AS P_MultBodyAggAux_recursive_head_f2
GROUP BY a, b),
t_14_P_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_15_E.a AS a,
      t_15_E.b AS b
    FROM
      t_3_E AS t_15_E
   UNION ALL
  
    SELECT
      P_r1.a AS a,
      t_16_E.b AS b
    FROM
      t_17_P_r1 AS P_r1, t_3_E AS t_16_E
    WHERE
      (t_16_E.a = P_r1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_13_P_r2 AS (SELECT
  P_MultBodyAggAux_recursive_head_f3.a AS a,
  P_MultBodyAggAux_recursive_head_f3.b AS b
FROM
  t_14_P_MultBodyAggAux_recursive_head_f3 AS P_MultBodyAggAux_recursive_head_f3
GROUP BY a, b),
t_10_P_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_11_E.a AS a,
      t_11_E.b AS b
    FROM
      t_3_E AS t_11_E
   UNION ALL
  
    SELECT
      P_r2.a AS a,
      t_12_E.b AS b
    FROM
      t_13_P_r2 AS P_r2, t_3_E AS t_12_E
    WHERE
      (t_12_E.a = P_r2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_9_P_r3 AS (SELECT
  P_MultBodyAggAux_recursive_head_f4.a AS a,
  P_MultBodyAggAux_recursive_head_f4.b AS b
FROM
  t_10_P_MultBodyAggAux_recursive_head_f4 AS P_MultBodyAggAux_recursive_head_f4
GROUP BY a, b),
t_6_P_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_7_E.a AS a,
      t_7_E.b AS b
    FROM
      t_3_E AS t_7_E
   UNION ALL
  
    SELECT
      P_r3.a AS a,
      t_8_E.b AS b
    FROM
      t_9_P_r3 AS P_r3, t_3_E AS t_8_E
    WHERE
      (t_8_E.a = P_r3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_5_P_r4 AS (SELECT
  P_MultBodyAggAux_recursive_head_f5.a AS a,
  P_MultBodyAggAux_recursive_head_f5.b AS b
FROM
  t_6_P_MultBodyAggAux_recursive_head_f5 AS P_MultBodyAggAux_recursive_head_f5
GROUP BY a, b),
t_2_P_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_3_E AS E
   UNION ALL
  
    SELECT
      P_r4.a AS a,
      t_4_E.b AS b
    FROM
      t_5_P_r4 AS P_r4, t_3_E AS t_4_E
    WHERE
      (t_4_E.a = P_r4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_1_P AS (SELECT
  P_MultBodyAggAux_recursive_head_f6.a AS a,
  P_MultBodyAggAux_recursive_head_f6.b AS b
FROM
  t_2_P_MultBodyAggAux_recursive_head_f6 AS P_MultBodyAggAux_recursive_head_f6
GROUP BY a, b)
SELECT
  P.a AS a,
  t_0_P.b AS c
FROM
  t_1_P AS P, t_1_P AS t_0_P
WHERE
  (t_0_P.a = P.b);