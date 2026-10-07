WITH t_2_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_2_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY R_MultBodyAggAux_recursive_head_f1.x),
t_4_E AS (SELECT * FROM (
  
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
t_0_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      t_1_R_r0 AS R_r0, t_4_E AS E
    WHERE
      (E.a = R_r0.x)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_0_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY R_MultBodyAggAux_recursive_head_f2.x ORDER BY x NULLS LAST;