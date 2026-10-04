WITH t_6_C_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_5_C_r0 AS (SELECT
  MAX(C_MultBodyAggAux_recursive_head_f1.n) AS n
FROM
  t_6_C_MultBodyAggAux_recursive_head_f1 AS C_MultBodyAggAux_recursive_head_f1),
t_4_C_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      ((C_r0.n) + (1)) AS n
    FROM
      t_5_C_r0 AS C_r0
    WHERE
      (C_r0.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_3_C_r1 AS (SELECT
  MAX(C_MultBodyAggAux_recursive_head_f2.n) AS n
FROM
  t_4_C_MultBodyAggAux_recursive_head_f2 AS C_MultBodyAggAux_recursive_head_f2),
t_2_C_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      ((C_r1.n) + (1)) AS n
    FROM
      t_3_C_r1 AS C_r1
    WHERE
      (C_r1.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_1_C_r2 AS (SELECT
  MAX(C_MultBodyAggAux_recursive_head_f3.n) AS n
FROM
  t_2_C_MultBodyAggAux_recursive_head_f3 AS C_MultBodyAggAux_recursive_head_f3),
t_0_C_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      ((C_r2.n) + (1)) AS n
    FROM
      t_1_C_r2 AS C_r2
    WHERE
      (C_r2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(C_MultBodyAggAux_recursive_head_f4.n) AS n
FROM
  t_0_C_MultBodyAggAux_recursive_head_f4 AS C_MultBodyAggAux_recursive_head_f4;