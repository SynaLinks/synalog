WITH t_8_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_7_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_8_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY x),
t_10_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b,
      1 AS w
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b,
      5 AS w
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b,
      5 AS w
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b,
      1 AS w
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b,
      1 AS w
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b,
      1 AS w
  
) AS UNUSED_TABLE_NAME  ),
t_5_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_6_E.b AS x
    FROM
      t_7_R_r0 AS R_r0, t_10_E AS t_6_E
    WHERE
      (t_6_E.a = R_r0.x)
  
) AS UNUSED_TABLE_NAME  ),
t_4_R_r1 AS (SELECT
  R_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_5_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY x),
t_2_R_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_3_E.b AS x
    FROM
      t_4_R_r1 AS R_r1, t_10_E AS t_3_E
    WHERE
      (t_3_E.a = R_r1.x)
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_r2 AS (SELECT
  R_MultBodyAggAux_recursive_head_f3.x AS x
FROM
  t_2_R_MultBodyAggAux_recursive_head_f3 AS R_MultBodyAggAux_recursive_head_f3
GROUP BY x),
t_0_R_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      t_1_R_r2 AS R_r2, t_10_E AS E
    WHERE
      (E.a = R_r2.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_recursive_head_f4.x AS x
FROM
  t_0_R_MultBodyAggAux_recursive_head_f4 AS R_MultBodyAggAux_recursive_head_f4
GROUP BY x ORDER BY x NULLS LAST;