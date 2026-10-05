WITH t_15_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_14_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_15_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY x),
t_12_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
    FROM
      t_14_R_r0 AS R_r0
    WHERE
      (R_r0.x = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_11_R_r1 AS (SELECT
  R_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_12_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY x),
t_9_R_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
    FROM
      t_11_R_r1 AS R_r1
    WHERE
      (R_r1.x = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_8_R_r2 AS (SELECT
  R_MultBodyAggAux_recursive_head_f3.x AS x
FROM
  t_9_R_MultBodyAggAux_recursive_head_f3 AS R_MultBodyAggAux_recursive_head_f3
GROUP BY x),
t_6_R_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
    FROM
      t_8_R_r2 AS R_r2
    WHERE
      (R_r2.x = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_5_R_r3 AS (SELECT
  R_MultBodyAggAux_recursive_head_f4.x AS x
FROM
  t_6_R_MultBodyAggAux_recursive_head_f4 AS R_MultBodyAggAux_recursive_head_f4
GROUP BY x),
t_3_R_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
    FROM
      t_5_R_r3 AS R_r3
    WHERE
      (R_r3.x = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_2_R_r4 AS (SELECT
  R_MultBodyAggAux_recursive_head_f5.x AS x
FROM
  t_3_R_MultBodyAggAux_recursive_head_f5 AS R_MultBodyAggAux_recursive_head_f5
GROUP BY x),
t_1_R_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
    FROM
      t_2_R_r4 AS R_r4
    WHERE
      (R_r4.x = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R AS (SELECT
  R_MultBodyAggAux_recursive_head_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_recursive_head_f6 AS R_MultBodyAggAux_recursive_head_f6
GROUP BY x)
SELECT
  SUM(1) AS n
FROM
  UNNEST(ARRAY[1, 2, 3, 4]) as x_2
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_R AS R
  WHERE
    (R.x = x_2)) IS NULL);