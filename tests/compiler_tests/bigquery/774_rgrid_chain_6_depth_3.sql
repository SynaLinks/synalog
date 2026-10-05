WITH t_8_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_7_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_8_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY x),
t_5_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_23) + (1)) AS x
    FROM
      t_7_R_r0 AS R_r0, UNNEST(GENERATE_ARRAY(0, 6 - 1)) as x_23
    WHERE
      (R_r0.x = x_23)
  
) AS UNUSED_TABLE_NAME  ),
t_4_R_r1 AS (SELECT
  R_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_5_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY x),
t_2_R_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_15) + (1)) AS x
    FROM
      t_4_R_r1 AS R_r1, UNNEST(GENERATE_ARRAY(0, 6 - 1)) as x_15
    WHERE
      (R_r1.x = x_15)
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_r2 AS (SELECT
  R_MultBodyAggAux_recursive_head_f3.x AS x
FROM
  t_2_R_MultBodyAggAux_recursive_head_f3 AS R_MultBodyAggAux_recursive_head_f3
GROUP BY x),
t_0_R_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS x
    FROM
      t_1_R_r2 AS R_r2, UNNEST(GENERATE_ARRAY(0, 6 - 1)) as x_7
    WHERE
      (R_r2.x = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_recursive_head_f4.x AS x
FROM
  t_0_R_MultBodyAggAux_recursive_head_f4 AS R_MultBodyAggAux_recursive_head_f4
GROUP BY x ORDER BY x NULLS LAST;