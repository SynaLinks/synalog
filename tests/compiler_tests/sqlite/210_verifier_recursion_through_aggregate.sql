WITH t_6_Count_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_5_Count_r0 AS (SELECT
  MAX(Count_MultBodyAggAux_recursive_head_f1.n) AS n
FROM
  t_6_Count_MultBodyAggAux_recursive_head_f1 AS Count_MultBodyAggAux_recursive_head_f1),
t_4_Count_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      ((Count_r0.n) + (1)) AS n
    FROM
      t_5_Count_r0 AS Count_r0
    WHERE
      (Count_r0.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_3_Count_r1 AS (SELECT
  MAX(Count_MultBodyAggAux_recursive_head_f2.n) AS n
FROM
  t_4_Count_MultBodyAggAux_recursive_head_f2 AS Count_MultBodyAggAux_recursive_head_f2),
t_2_Count_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      ((Count_r1.n) + (1)) AS n
    FROM
      t_3_Count_r1 AS Count_r1
    WHERE
      (Count_r1.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_1_Count_r2 AS (SELECT
  MAX(Count_MultBodyAggAux_recursive_head_f3.n) AS n
FROM
  t_2_Count_MultBodyAggAux_recursive_head_f3 AS Count_MultBodyAggAux_recursive_head_f3),
t_0_Count_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      ((Count_r2.n) + (1)) AS n
    FROM
      t_1_Count_r2 AS Count_r2
    WHERE
      (Count_r2.n < 3)
   UNION ALL
  
    SELECT
      1 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(Count_MultBodyAggAux_recursive_head_f4.n) AS n
FROM
  t_0_Count_MultBodyAggAux_recursive_head_f4 AS Count_MultBodyAggAux_recursive_head_f4;