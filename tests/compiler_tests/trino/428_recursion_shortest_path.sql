WITH t_17_Dist_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      0 AS d
  
) AS UNUSED_TABLE_NAME  ),
t_16_Dist_r0 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f1.n AS n,
  MIN(Dist_MultBodyAggAux_recursive_head_f1.d) AS d
FROM
  t_17_Dist_MultBodyAggAux_recursive_head_f1 AS Dist_MultBodyAggAux_recursive_head_f1
GROUP BY 1),
t_19_E AS (SELECT * FROM (
  
    SELECT
      'a' AS a,
      'b' AS b
   UNION ALL
  
    SELECT
      'b' AS a,
      'c' AS b
   UNION ALL
  
    SELECT
      'a' AS a,
      'd' AS b
   UNION ALL
  
    SELECT
      'd' AS a,
      'c' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_14_Dist_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      0 AS d
   UNION ALL
  
    SELECT
      t_15_E.b AS n,
      ((Dist_r0.d) + (1)) AS d
    FROM
      t_16_Dist_r0 AS Dist_r0, t_19_E AS t_15_E
    WHERE
      (t_15_E.a = Dist_r0.n)
  
) AS UNUSED_TABLE_NAME  ),
t_13_Dist_r1 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f2.n AS n,
  MIN(Dist_MultBodyAggAux_recursive_head_f2.d) AS d
FROM
  t_14_Dist_MultBodyAggAux_recursive_head_f2 AS Dist_MultBodyAggAux_recursive_head_f2
GROUP BY 1),
t_11_Dist_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      0 AS d
   UNION ALL
  
    SELECT
      t_12_E.b AS n,
      ((Dist_r1.d) + (1)) AS d
    FROM
      t_13_Dist_r1 AS Dist_r1, t_19_E AS t_12_E
    WHERE
      (t_12_E.a = Dist_r1.n)
  
) AS UNUSED_TABLE_NAME  ),
t_10_Dist_r2 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f3.n AS n,
  MIN(Dist_MultBodyAggAux_recursive_head_f3.d) AS d
FROM
  t_11_Dist_MultBodyAggAux_recursive_head_f3 AS Dist_MultBodyAggAux_recursive_head_f3
GROUP BY 1),
t_8_Dist_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      0 AS d
   UNION ALL
  
    SELECT
      t_9_E.b AS n,
      ((Dist_r2.d) + (1)) AS d
    FROM
      t_10_Dist_r2 AS Dist_r2, t_19_E AS t_9_E
    WHERE
      (t_9_E.a = Dist_r2.n)
  
) AS UNUSED_TABLE_NAME  ),
t_7_Dist_r3 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f4.n AS n,
  MIN(Dist_MultBodyAggAux_recursive_head_f4.d) AS d
FROM
  t_8_Dist_MultBodyAggAux_recursive_head_f4 AS Dist_MultBodyAggAux_recursive_head_f4
GROUP BY 1),
t_5_Dist_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      0 AS d
   UNION ALL
  
    SELECT
      t_6_E.b AS n,
      ((Dist_r3.d) + (1)) AS d
    FROM
      t_7_Dist_r3 AS Dist_r3, t_19_E AS t_6_E
    WHERE
      (t_6_E.a = Dist_r3.n)
  
) AS UNUSED_TABLE_NAME  ),
t_4_Dist_r4 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f5.n AS n,
  MIN(Dist_MultBodyAggAux_recursive_head_f5.d) AS d
FROM
  t_5_Dist_MultBodyAggAux_recursive_head_f5 AS Dist_MultBodyAggAux_recursive_head_f5
GROUP BY 1),
t_2_Dist_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      0 AS d
   UNION ALL
  
    SELECT
      t_3_E.b AS n,
      ((Dist_r4.d) + (1)) AS d
    FROM
      t_4_Dist_r4 AS Dist_r4, t_19_E AS t_3_E
    WHERE
      (t_3_E.a = Dist_r4.n)
  
) AS UNUSED_TABLE_NAME  ),
t_1_Dist_r5 AS (SELECT
  Dist_MultBodyAggAux_recursive_head_f6.n AS n,
  MIN(Dist_MultBodyAggAux_recursive_head_f6.d) AS d
FROM
  t_2_Dist_MultBodyAggAux_recursive_head_f6 AS Dist_MultBodyAggAux_recursive_head_f6
GROUP BY 1),
t_0_Dist_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      0 AS d
   UNION ALL
  
    SELECT
      E.b AS n,
      ((Dist_r5.d) + (1)) AS d
    FROM
      t_1_Dist_r5 AS Dist_r5, t_19_E AS E
    WHERE
      (E.a = Dist_r5.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_recursive_head_f7.n AS n,
  MIN(Dist_MultBodyAggAux_recursive_head_f7.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_recursive_head_f7 AS Dist_MultBodyAggAux_recursive_head_f7
GROUP BY 1 ORDER BY n;