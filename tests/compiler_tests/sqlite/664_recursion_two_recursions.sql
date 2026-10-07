WITH t_15_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_14_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_15_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY R_MultBodyAggAux_recursive_head_f1.x),
t_17_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_12_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_13_E.b AS x
    FROM
      t_14_R_r0 AS R_r0, t_17_E AS t_13_E
    WHERE
      (t_13_E.a = R_r0.x)
  
) AS UNUSED_TABLE_NAME  ),
t_11_R_r1 AS (SELECT
  R_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_12_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY R_MultBodyAggAux_recursive_head_f2.x),
t_9_R_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_10_E.b AS x
    FROM
      t_11_R_r1 AS R_r1, t_17_E AS t_10_E
    WHERE
      (t_10_E.a = R_r1.x)
  
) AS UNUSED_TABLE_NAME  ),
t_8_R_r2 AS (SELECT
  R_MultBodyAggAux_recursive_head_f3.x AS x
FROM
  t_9_R_MultBodyAggAux_recursive_head_f3 AS R_MultBodyAggAux_recursive_head_f3
GROUP BY R_MultBodyAggAux_recursive_head_f3.x),
t_6_R_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_7_E.b AS x
    FROM
      t_8_R_r2 AS R_r2, t_17_E AS t_7_E
    WHERE
      (t_7_E.a = R_r2.x)
  
) AS UNUSED_TABLE_NAME  ),
t_5_R_r3 AS (SELECT
  R_MultBodyAggAux_recursive_head_f4.x AS x
FROM
  t_6_R_MultBodyAggAux_recursive_head_f4 AS R_MultBodyAggAux_recursive_head_f4
GROUP BY R_MultBodyAggAux_recursive_head_f4.x),
t_3_R_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_4_E.b AS x
    FROM
      t_5_R_r3 AS R_r3, t_17_E AS t_4_E
    WHERE
      (t_4_E.a = R_r3.x)
  
) AS UNUSED_TABLE_NAME  ),
t_2_R_r4 AS (SELECT
  R_MultBodyAggAux_recursive_head_f5.x AS x
FROM
  t_3_R_MultBodyAggAux_recursive_head_f5 AS R_MultBodyAggAux_recursive_head_f5
GROUP BY R_MultBodyAggAux_recursive_head_f5.x),
t_1_R_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      t_2_R_r4 AS R_r4, t_17_E AS E
    WHERE
      (E.a = R_r4.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R AS (SELECT
  R_MultBodyAggAux_recursive_head_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_recursive_head_f6 AS R_MultBodyAggAux_recursive_head_f6
GROUP BY R_MultBodyAggAux_recursive_head_f6.x),
t_34_S_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_33_S_r0 AS (SELECT
  S_MultBodyAggAux_recursive_head_f7.x AS x
FROM
  t_34_S_MultBodyAggAux_recursive_head_f7 AS S_MultBodyAggAux_recursive_head_f7
GROUP BY S_MultBodyAggAux_recursive_head_f7.x),
t_31_S_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      t_32_E.a AS x
    FROM
      t_33_S_r0 AS S_r0, t_17_E AS t_32_E
    WHERE
      (t_32_E.b = S_r0.x)
  
) AS UNUSED_TABLE_NAME  ),
t_30_S_r1 AS (SELECT
  S_MultBodyAggAux_recursive_head_f8.x AS x
FROM
  t_31_S_MultBodyAggAux_recursive_head_f8 AS S_MultBodyAggAux_recursive_head_f8
GROUP BY S_MultBodyAggAux_recursive_head_f8.x),
t_28_S_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      t_29_E.a AS x
    FROM
      t_30_S_r1 AS S_r1, t_17_E AS t_29_E
    WHERE
      (t_29_E.b = S_r1.x)
  
) AS UNUSED_TABLE_NAME  ),
t_27_S_r2 AS (SELECT
  S_MultBodyAggAux_recursive_head_f9.x AS x
FROM
  t_28_S_MultBodyAggAux_recursive_head_f9 AS S_MultBodyAggAux_recursive_head_f9
GROUP BY S_MultBodyAggAux_recursive_head_f9.x),
t_25_S_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      t_26_E.a AS x
    FROM
      t_27_S_r2 AS S_r2, t_17_E AS t_26_E
    WHERE
      (t_26_E.b = S_r2.x)
  
) AS UNUSED_TABLE_NAME  ),
t_24_S_r3 AS (SELECT
  S_MultBodyAggAux_recursive_head_f10.x AS x
FROM
  t_25_S_MultBodyAggAux_recursive_head_f10 AS S_MultBodyAggAux_recursive_head_f10
GROUP BY S_MultBodyAggAux_recursive_head_f10.x),
t_22_S_MultBodyAggAux_recursive_head_f11 AS (SELECT * FROM (
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      t_23_E.a AS x
    FROM
      t_24_S_r3 AS S_r3, t_17_E AS t_23_E
    WHERE
      (t_23_E.b = S_r3.x)
  
) AS UNUSED_TABLE_NAME  ),
t_21_S_r4 AS (SELECT
  S_MultBodyAggAux_recursive_head_f11.x AS x
FROM
  t_22_S_MultBodyAggAux_recursive_head_f11 AS S_MultBodyAggAux_recursive_head_f11
GROUP BY S_MultBodyAggAux_recursive_head_f11.x),
t_19_S_MultBodyAggAux_recursive_head_f12 AS (SELECT * FROM (
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      t_20_E.a AS x
    FROM
      t_21_S_r4 AS S_r4, t_17_E AS t_20_E
    WHERE
      (t_20_E.b = S_r4.x)
  
) AS UNUSED_TABLE_NAME  ),
t_18_S AS (SELECT
  S_MultBodyAggAux_recursive_head_f12.x AS x
FROM
  t_19_S_MultBodyAggAux_recursive_head_f12 AS S_MultBodyAggAux_recursive_head_f12
GROUP BY S_MultBodyAggAux_recursive_head_f12.x)
SELECT
  R.x AS x
FROM
  t_0_R AS R, t_18_S AS S
WHERE
  (R.x > 2) AND
  (S.x = R.x);