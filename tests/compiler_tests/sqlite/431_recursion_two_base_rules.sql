WITH t_6_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      10 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_5_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_6_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY R_MultBodyAggAux_recursive_head_f1.x),
t_4_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      ((R_r0.x) + (1)) AS x
    FROM
      t_5_R_r0 AS R_r0
    WHERE
      ((((R_r0.x) % (10)) = 0) OR (R_r0.x = 1))
   UNION ALL
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      10 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_3_R_r1 AS (SELECT
  R_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_4_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY R_MultBodyAggAux_recursive_head_f2.x),
t_2_R_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      ((R_r1.x) + (1)) AS x
    FROM
      t_3_R_r1 AS R_r1
    WHERE
      ((((R_r1.x) % (10)) = 0) OR (R_r1.x = 1))
   UNION ALL
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      10 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_r2 AS (SELECT
  R_MultBodyAggAux_recursive_head_f3.x AS x
FROM
  t_2_R_MultBodyAggAux_recursive_head_f3 AS R_MultBodyAggAux_recursive_head_f3
GROUP BY R_MultBodyAggAux_recursive_head_f3.x),
t_0_R_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      ((R_r2.x) + (1)) AS x
    FROM
      t_1_R_r2 AS R_r2
    WHERE
      ((((R_r2.x) % (10)) = 0) OR (R_r2.x = 1))
   UNION ALL
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      10 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_recursive_head_f4.x AS x
FROM
  t_0_R_MultBodyAggAux_recursive_head_f4 AS R_MultBodyAggAux_recursive_head_f4
GROUP BY R_MultBodyAggAux_recursive_head_f4.x ORDER BY x;