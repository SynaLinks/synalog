WITH t_2_E AS (SELECT * FROM (
  
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
t_33_P_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_34_E.a AS a,
      t_34_E.b AS b
    FROM
      t_2_E AS t_34_E
  
) AS UNUSED_TABLE_NAME  ),
t_32_P_r0 AS (SELECT
  P_MultBodyAggAux_recursive_head_f1.a AS a,
  P_MultBodyAggAux_recursive_head_f1.b AS b
FROM
  t_33_P_MultBodyAggAux_recursive_head_f1 AS P_MultBodyAggAux_recursive_head_f1
GROUP BY P_MultBodyAggAux_recursive_head_f1.a, P_MultBodyAggAux_recursive_head_f1.b),
t_29_P_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_30_E.a AS a,
      t_30_E.b AS b
    FROM
      t_2_E AS t_30_E
   UNION ALL
  
    SELECT
      P_r0.a AS a,
      t_31_E.b AS b
    FROM
      t_32_P_r0 AS P_r0, t_2_E AS t_31_E
    WHERE
      (t_31_E.a = P_r0.b)
  
) AS UNUSED_TABLE_NAME  ),
t_28_P_r1 AS (SELECT
  P_MultBodyAggAux_recursive_head_f2.a AS a,
  P_MultBodyAggAux_recursive_head_f2.b AS b
FROM
  t_29_P_MultBodyAggAux_recursive_head_f2 AS P_MultBodyAggAux_recursive_head_f2
GROUP BY P_MultBodyAggAux_recursive_head_f2.a, P_MultBodyAggAux_recursive_head_f2.b),
t_25_P_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_26_E.a AS a,
      t_26_E.b AS b
    FROM
      t_2_E AS t_26_E
   UNION ALL
  
    SELECT
      P_r1.a AS a,
      t_27_E.b AS b
    FROM
      t_28_P_r1 AS P_r1, t_2_E AS t_27_E
    WHERE
      (t_27_E.a = P_r1.b)
  
) AS UNUSED_TABLE_NAME  ),
t_24_P_r2 AS (SELECT
  P_MultBodyAggAux_recursive_head_f3.a AS a,
  P_MultBodyAggAux_recursive_head_f3.b AS b
FROM
  t_25_P_MultBodyAggAux_recursive_head_f3 AS P_MultBodyAggAux_recursive_head_f3
GROUP BY P_MultBodyAggAux_recursive_head_f3.a, P_MultBodyAggAux_recursive_head_f3.b),
t_21_P_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_22_E.a AS a,
      t_22_E.b AS b
    FROM
      t_2_E AS t_22_E
   UNION ALL
  
    SELECT
      P_r2.a AS a,
      t_23_E.b AS b
    FROM
      t_24_P_r2 AS P_r2, t_2_E AS t_23_E
    WHERE
      (t_23_E.a = P_r2.b)
  
) AS UNUSED_TABLE_NAME  ),
t_20_P_r3 AS (SELECT
  P_MultBodyAggAux_recursive_head_f4.a AS a,
  P_MultBodyAggAux_recursive_head_f4.b AS b
FROM
  t_21_P_MultBodyAggAux_recursive_head_f4 AS P_MultBodyAggAux_recursive_head_f4
GROUP BY P_MultBodyAggAux_recursive_head_f4.a, P_MultBodyAggAux_recursive_head_f4.b),
t_17_P_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_18_E.a AS a,
      t_18_E.b AS b
    FROM
      t_2_E AS t_18_E
   UNION ALL
  
    SELECT
      P_r3.a AS a,
      t_19_E.b AS b
    FROM
      t_20_P_r3 AS P_r3, t_2_E AS t_19_E
    WHERE
      (t_19_E.a = P_r3.b)
  
) AS UNUSED_TABLE_NAME  ),
t_16_P_r4 AS (SELECT
  P_MultBodyAggAux_recursive_head_f5.a AS a,
  P_MultBodyAggAux_recursive_head_f5.b AS b
FROM
  t_17_P_MultBodyAggAux_recursive_head_f5 AS P_MultBodyAggAux_recursive_head_f5
GROUP BY P_MultBodyAggAux_recursive_head_f5.a, P_MultBodyAggAux_recursive_head_f5.b),
t_13_P_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_14_E.a AS a,
      t_14_E.b AS b
    FROM
      t_2_E AS t_14_E
   UNION ALL
  
    SELECT
      P_r4.a AS a,
      t_15_E.b AS b
    FROM
      t_16_P_r4 AS P_r4, t_2_E AS t_15_E
    WHERE
      (t_15_E.a = P_r4.b)
  
) AS UNUSED_TABLE_NAME  ),
t_12_P_r5 AS (SELECT
  P_MultBodyAggAux_recursive_head_f6.a AS a,
  P_MultBodyAggAux_recursive_head_f6.b AS b
FROM
  t_13_P_MultBodyAggAux_recursive_head_f6 AS P_MultBodyAggAux_recursive_head_f6
GROUP BY P_MultBodyAggAux_recursive_head_f6.a, P_MultBodyAggAux_recursive_head_f6.b),
t_9_P_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      t_10_E.a AS a,
      t_10_E.b AS b
    FROM
      t_2_E AS t_10_E
   UNION ALL
  
    SELECT
      P_r5.a AS a,
      t_11_E.b AS b
    FROM
      t_12_P_r5 AS P_r5, t_2_E AS t_11_E
    WHERE
      (t_11_E.a = P_r5.b)
  
) AS UNUSED_TABLE_NAME  ),
t_8_P_r6 AS (SELECT
  P_MultBodyAggAux_recursive_head_f7.a AS a,
  P_MultBodyAggAux_recursive_head_f7.b AS b
FROM
  t_9_P_MultBodyAggAux_recursive_head_f7 AS P_MultBodyAggAux_recursive_head_f7
GROUP BY P_MultBodyAggAux_recursive_head_f7.a, P_MultBodyAggAux_recursive_head_f7.b),
t_5_P_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      t_6_E.a AS a,
      t_6_E.b AS b
    FROM
      t_2_E AS t_6_E
   UNION ALL
  
    SELECT
      P_r6.a AS a,
      t_7_E.b AS b
    FROM
      t_8_P_r6 AS P_r6, t_2_E AS t_7_E
    WHERE
      (t_7_E.a = P_r6.b)
  
) AS UNUSED_TABLE_NAME  ),
t_4_P_r7 AS (SELECT
  P_MultBodyAggAux_recursive_head_f8.a AS a,
  P_MultBodyAggAux_recursive_head_f8.b AS b
FROM
  t_5_P_MultBodyAggAux_recursive_head_f8 AS P_MultBodyAggAux_recursive_head_f8
GROUP BY P_MultBodyAggAux_recursive_head_f8.a, P_MultBodyAggAux_recursive_head_f8.b),
t_1_P_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_2_E AS E
   UNION ALL
  
    SELECT
      P_r7.a AS a,
      t_3_E.b AS b
    FROM
      t_4_P_r7 AS P_r7, t_2_E AS t_3_E
    WHERE
      (t_3_E.a = P_r7.b)
  
) AS UNUSED_TABLE_NAME  ),
t_0_P AS (SELECT
  P_MultBodyAggAux_recursive_head_f9.a AS a,
  P_MultBodyAggAux_recursive_head_f9.b AS b
FROM
  t_1_P_MultBodyAggAux_recursive_head_f9 AS P_MultBodyAggAux_recursive_head_f9
GROUP BY P_MultBodyAggAux_recursive_head_f9.a, P_MultBodyAggAux_recursive_head_f9.b)
SELECT
  SUM(1) AS n
FROM
  t_0_P AS P;