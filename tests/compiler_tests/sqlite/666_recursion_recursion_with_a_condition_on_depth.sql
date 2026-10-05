WITH t_20_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_19_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_20_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY R_MultBodyAggAux_recursive_head_f1.x),
t_18_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      ((R_r0.x) * (2)) AS x
    FROM
      t_19_R_r0 AS R_r0
    WHERE
      (R_r0.x < 8)
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_17_R_r1 AS (SELECT
  R_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_18_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY R_MultBodyAggAux_recursive_head_f2.x),
t_16_R_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      ((R_r1.x) * (2)) AS x
    FROM
      t_17_R_r1 AS R_r1
    WHERE
      (R_r1.x < 8)
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_15_R_r2 AS (SELECT
  R_MultBodyAggAux_recursive_head_f3.x AS x
FROM
  t_16_R_MultBodyAggAux_recursive_head_f3 AS R_MultBodyAggAux_recursive_head_f3
GROUP BY R_MultBodyAggAux_recursive_head_f3.x),
t_14_R_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      ((R_r2.x) * (2)) AS x
    FROM
      t_15_R_r2 AS R_r2
    WHERE
      (R_r2.x < 8)
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_13_R_r3 AS (SELECT
  R_MultBodyAggAux_recursive_head_f4.x AS x
FROM
  t_14_R_MultBodyAggAux_recursive_head_f4 AS R_MultBodyAggAux_recursive_head_f4
GROUP BY R_MultBodyAggAux_recursive_head_f4.x),
t_12_R_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      ((R_r3.x) * (2)) AS x
    FROM
      t_13_R_r3 AS R_r3
    WHERE
      (R_r3.x < 8)
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_11_R_r4 AS (SELECT
  R_MultBodyAggAux_recursive_head_f5.x AS x
FROM
  t_12_R_MultBodyAggAux_recursive_head_f5 AS R_MultBodyAggAux_recursive_head_f5
GROUP BY R_MultBodyAggAux_recursive_head_f5.x),
t_10_R_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      ((R_r4.x) * (2)) AS x
    FROM
      t_11_R_r4 AS R_r4
    WHERE
      (R_r4.x < 8)
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_9_R_r5 AS (SELECT
  R_MultBodyAggAux_recursive_head_f6.x AS x
FROM
  t_10_R_MultBodyAggAux_recursive_head_f6 AS R_MultBodyAggAux_recursive_head_f6
GROUP BY R_MultBodyAggAux_recursive_head_f6.x),
t_8_R_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      ((R_r5.x) * (2)) AS x
    FROM
      t_9_R_r5 AS R_r5
    WHERE
      (R_r5.x < 8)
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_7_R_r6 AS (SELECT
  R_MultBodyAggAux_recursive_head_f7.x AS x
FROM
  t_8_R_MultBodyAggAux_recursive_head_f7 AS R_MultBodyAggAux_recursive_head_f7
GROUP BY R_MultBodyAggAux_recursive_head_f7.x),
t_6_R_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      ((R_r6.x) * (2)) AS x
    FROM
      t_7_R_r6 AS R_r6
    WHERE
      (R_r6.x < 8)
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_5_R_r7 AS (SELECT
  R_MultBodyAggAux_recursive_head_f8.x AS x
FROM
  t_6_R_MultBodyAggAux_recursive_head_f8 AS R_MultBodyAggAux_recursive_head_f8
GROUP BY R_MultBodyAggAux_recursive_head_f8.x),
t_4_R_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      ((R_r7.x) * (2)) AS x
    FROM
      t_5_R_r7 AS R_r7
    WHERE
      (R_r7.x < 8)
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_3_R_r8 AS (SELECT
  R_MultBodyAggAux_recursive_head_f9.x AS x
FROM
  t_4_R_MultBodyAggAux_recursive_head_f9 AS R_MultBodyAggAux_recursive_head_f9
GROUP BY R_MultBodyAggAux_recursive_head_f9.x),
t_2_R_MultBodyAggAux_recursive_head_f10 AS (SELECT * FROM (
  
    SELECT
      ((R_r8.x) * (2)) AS x
    FROM
      t_3_R_r8 AS R_r8
    WHERE
      (R_r8.x < 8)
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_r9 AS (SELECT
  R_MultBodyAggAux_recursive_head_f10.x AS x
FROM
  t_2_R_MultBodyAggAux_recursive_head_f10 AS R_MultBodyAggAux_recursive_head_f10
GROUP BY R_MultBodyAggAux_recursive_head_f10.x),
t_0_R_MultBodyAggAux_recursive_head_f11 AS (SELECT * FROM (
  
    SELECT
      ((R_r9.x) * (2)) AS x
    FROM
      t_1_R_r9 AS R_r9
    WHERE
      (R_r9.x < 8)
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_recursive_head_f11.x AS x
FROM
  t_0_R_MultBodyAggAux_recursive_head_f11 AS R_MultBodyAggAux_recursive_head_f11
GROUP BY R_MultBodyAggAux_recursive_head_f11.x ORDER BY x NULLS LAST;