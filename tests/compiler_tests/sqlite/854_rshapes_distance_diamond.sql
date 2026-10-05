WITH t_23_D_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
  
) AS UNUSED_TABLE_NAME  ),
t_22_D_r0 AS (SELECT
  D_MultBodyAggAux_recursive_head_f1.n AS n,
  MIN(D_MultBodyAggAux_recursive_head_f1.d) AS d
FROM
  t_23_D_MultBodyAggAux_recursive_head_f1 AS D_MultBodyAggAux_recursive_head_f1
GROUP BY D_MultBodyAggAux_recursive_head_f1.n),
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
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_20_D_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      t_21_E.b AS n,
      ((D_r0.d) + (1)) AS d
    FROM
      t_22_D_r0 AS D_r0, t_25_E AS t_21_E
    WHERE
      (t_21_E.a = D_r0.n)
  
) AS UNUSED_TABLE_NAME  ),
t_19_D_r1 AS (SELECT
  D_MultBodyAggAux_recursive_head_f2.n AS n,
  MIN(D_MultBodyAggAux_recursive_head_f2.d) AS d
FROM
  t_20_D_MultBodyAggAux_recursive_head_f2 AS D_MultBodyAggAux_recursive_head_f2
GROUP BY D_MultBodyAggAux_recursive_head_f2.n),
t_17_D_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      t_18_E.b AS n,
      ((D_r1.d) + (1)) AS d
    FROM
      t_19_D_r1 AS D_r1, t_25_E AS t_18_E
    WHERE
      (t_18_E.a = D_r1.n)
  
) AS UNUSED_TABLE_NAME  ),
t_16_D_r2 AS (SELECT
  D_MultBodyAggAux_recursive_head_f3.n AS n,
  MIN(D_MultBodyAggAux_recursive_head_f3.d) AS d
FROM
  t_17_D_MultBodyAggAux_recursive_head_f3 AS D_MultBodyAggAux_recursive_head_f3
GROUP BY D_MultBodyAggAux_recursive_head_f3.n),
t_14_D_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      t_15_E.b AS n,
      ((D_r2.d) + (1)) AS d
    FROM
      t_16_D_r2 AS D_r2, t_25_E AS t_15_E
    WHERE
      (t_15_E.a = D_r2.n)
  
) AS UNUSED_TABLE_NAME  ),
t_13_D_r3 AS (SELECT
  D_MultBodyAggAux_recursive_head_f4.n AS n,
  MIN(D_MultBodyAggAux_recursive_head_f4.d) AS d
FROM
  t_14_D_MultBodyAggAux_recursive_head_f4 AS D_MultBodyAggAux_recursive_head_f4
GROUP BY D_MultBodyAggAux_recursive_head_f4.n),
t_11_D_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      t_12_E.b AS n,
      ((D_r3.d) + (1)) AS d
    FROM
      t_13_D_r3 AS D_r3, t_25_E AS t_12_E
    WHERE
      (t_12_E.a = D_r3.n)
  
) AS UNUSED_TABLE_NAME  ),
t_10_D_r4 AS (SELECT
  D_MultBodyAggAux_recursive_head_f5.n AS n,
  MIN(D_MultBodyAggAux_recursive_head_f5.d) AS d
FROM
  t_11_D_MultBodyAggAux_recursive_head_f5 AS D_MultBodyAggAux_recursive_head_f5
GROUP BY D_MultBodyAggAux_recursive_head_f5.n),
t_8_D_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      t_9_E.b AS n,
      ((D_r4.d) + (1)) AS d
    FROM
      t_10_D_r4 AS D_r4, t_25_E AS t_9_E
    WHERE
      (t_9_E.a = D_r4.n)
  
) AS UNUSED_TABLE_NAME  ),
t_7_D_r5 AS (SELECT
  D_MultBodyAggAux_recursive_head_f6.n AS n,
  MIN(D_MultBodyAggAux_recursive_head_f6.d) AS d
FROM
  t_8_D_MultBodyAggAux_recursive_head_f6 AS D_MultBodyAggAux_recursive_head_f6
GROUP BY D_MultBodyAggAux_recursive_head_f6.n),
t_5_D_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      t_6_E.b AS n,
      ((D_r5.d) + (1)) AS d
    FROM
      t_7_D_r5 AS D_r5, t_25_E AS t_6_E
    WHERE
      (t_6_E.a = D_r5.n)
  
) AS UNUSED_TABLE_NAME  ),
t_4_D_r6 AS (SELECT
  D_MultBodyAggAux_recursive_head_f7.n AS n,
  MIN(D_MultBodyAggAux_recursive_head_f7.d) AS d
FROM
  t_5_D_MultBodyAggAux_recursive_head_f7 AS D_MultBodyAggAux_recursive_head_f7
GROUP BY D_MultBodyAggAux_recursive_head_f7.n),
t_2_D_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      t_3_E.b AS n,
      ((D_r6.d) + (1)) AS d
    FROM
      t_4_D_r6 AS D_r6, t_25_E AS t_3_E
    WHERE
      (t_3_E.a = D_r6.n)
  
) AS UNUSED_TABLE_NAME  ),
t_1_D_r7 AS (SELECT
  D_MultBodyAggAux_recursive_head_f8.n AS n,
  MIN(D_MultBodyAggAux_recursive_head_f8.d) AS d
FROM
  t_2_D_MultBodyAggAux_recursive_head_f8 AS D_MultBodyAggAux_recursive_head_f8
GROUP BY D_MultBodyAggAux_recursive_head_f8.n),
t_0_D_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((D_r7.d) + (1)) AS d
    FROM
      t_1_D_r7 AS D_r7, t_25_E AS E
    WHERE
      (E.a = D_r7.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  D_MultBodyAggAux_recursive_head_f9.n AS n,
  MIN(D_MultBodyAggAux_recursive_head_f9.d) AS d
FROM
  t_0_D_MultBodyAggAux_recursive_head_f9 AS D_MultBodyAggAux_recursive_head_f9
GROUP BY D_MultBodyAggAux_recursive_head_f9.n ORDER BY n NULLS LAST;