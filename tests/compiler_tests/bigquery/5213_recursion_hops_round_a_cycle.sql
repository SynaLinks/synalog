WITH t_14_P_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
  
) AS UNUSED_TABLE_NAME  ),
t_13_P_r0 AS (SELECT
  P_MultBodyAggAux_recursive_head_f1.n AS n,
  P_MultBodyAggAux_recursive_head_f1.h AS h
FROM
  t_14_P_MultBodyAggAux_recursive_head_f1 AS P_MultBodyAggAux_recursive_head_f1
GROUP BY n, h),
t_16_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_11_P_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
   UNION ALL
  
    SELECT
      t_12_E.b AS n,
      ((P_r0.h) + (1)) AS h
    FROM
      t_13_P_r0 AS P_r0, t_16_E AS t_12_E
    WHERE
      (t_12_E.a IS NOT DISTINCT FROM P_r0.n)
  
) AS UNUSED_TABLE_NAME  ),
t_10_P_r1 AS (SELECT
  P_MultBodyAggAux_recursive_head_f2.n AS n,
  P_MultBodyAggAux_recursive_head_f2.h AS h
FROM
  t_11_P_MultBodyAggAux_recursive_head_f2 AS P_MultBodyAggAux_recursive_head_f2
GROUP BY n, h),
t_8_P_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
   UNION ALL
  
    SELECT
      t_9_E.b AS n,
      ((P_r1.h) + (1)) AS h
    FROM
      t_10_P_r1 AS P_r1, t_16_E AS t_9_E
    WHERE
      (t_9_E.a IS NOT DISTINCT FROM P_r1.n)
  
) AS UNUSED_TABLE_NAME  ),
t_7_P_r2 AS (SELECT
  P_MultBodyAggAux_recursive_head_f3.n AS n,
  P_MultBodyAggAux_recursive_head_f3.h AS h
FROM
  t_8_P_MultBodyAggAux_recursive_head_f3 AS P_MultBodyAggAux_recursive_head_f3
GROUP BY n, h),
t_5_P_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
   UNION ALL
  
    SELECT
      t_6_E.b AS n,
      ((P_r2.h) + (1)) AS h
    FROM
      t_7_P_r2 AS P_r2, t_16_E AS t_6_E
    WHERE
      (t_6_E.a IS NOT DISTINCT FROM P_r2.n)
  
) AS UNUSED_TABLE_NAME  ),
t_4_P_r3 AS (SELECT
  P_MultBodyAggAux_recursive_head_f4.n AS n,
  P_MultBodyAggAux_recursive_head_f4.h AS h
FROM
  t_5_P_MultBodyAggAux_recursive_head_f4 AS P_MultBodyAggAux_recursive_head_f4
GROUP BY n, h),
t_2_P_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
   UNION ALL
  
    SELECT
      t_3_E.b AS n,
      ((P_r3.h) + (1)) AS h
    FROM
      t_4_P_r3 AS P_r3, t_16_E AS t_3_E
    WHERE
      (t_3_E.a IS NOT DISTINCT FROM P_r3.n)
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_r4 AS (SELECT
  P_MultBodyAggAux_recursive_head_f5.n AS n,
  P_MultBodyAggAux_recursive_head_f5.h AS h
FROM
  t_2_P_MultBodyAggAux_recursive_head_f5 AS P_MultBodyAggAux_recursive_head_f5
GROUP BY n, h),
t_0_P_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      0 AS h
   UNION ALL
  
    SELECT
      E.b AS n,
      ((P_r4.h) + (1)) AS h
    FROM
      t_1_P_r4 AS P_r4, t_16_E AS E
    WHERE
      (E.a IS NOT DISTINCT FROM P_r4.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P_MultBodyAggAux_recursive_head_f6.n AS n,
  P_MultBodyAggAux_recursive_head_f6.h AS h
FROM
  t_0_P_MultBodyAggAux_recursive_head_f6 AS P_MultBodyAggAux_recursive_head_f6
GROUP BY n, h ORDER BY h NULLS LAST;