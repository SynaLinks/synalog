WITH t_14_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      x_37 AS x
    FROM
      UNNEST(ARRAY[1]) as x_37
    WHERE
      (x_37 > 5)
  
) AS UNUSED_TABLE_NAME  ),
t_13_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_14_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY x),
t_11_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      2 AS x
    FROM
      t_13_R_r0 AS R_r0
    WHERE
      (R_r0.x = 1)
   UNION ALL
  
    SELECT
      x_39 AS x
    FROM
      UNNEST(ARRAY[1]) as x_39
    WHERE
      (x_39 > 5)
  
) AS UNUSED_TABLE_NAME  ),
t_10_R_r1 AS (SELECT
  R_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_11_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY x),
t_8_R_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      2 AS x
    FROM
      t_10_R_r1 AS R_r1
    WHERE
      (R_r1.x = 1)
   UNION ALL
  
    SELECT
      x_41 AS x
    FROM
      UNNEST(ARRAY[1]) as x_41
    WHERE
      (x_41 > 5)
  
) AS UNUSED_TABLE_NAME  ),
t_7_R_r2 AS (SELECT
  R_MultBodyAggAux_recursive_head_f3.x AS x
FROM
  t_8_R_MultBodyAggAux_recursive_head_f3 AS R_MultBodyAggAux_recursive_head_f3
GROUP BY x),
t_5_R_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      2 AS x
    FROM
      t_7_R_r2 AS R_r2
    WHERE
      (R_r2.x = 1)
   UNION ALL
  
    SELECT
      x_43 AS x
    FROM
      UNNEST(ARRAY[1]) as x_43
    WHERE
      (x_43 > 5)
  
) AS UNUSED_TABLE_NAME  ),
t_4_R_r3 AS (SELECT
  R_MultBodyAggAux_recursive_head_f4.x AS x
FROM
  t_5_R_MultBodyAggAux_recursive_head_f4 AS R_MultBodyAggAux_recursive_head_f4
GROUP BY x),
t_2_R_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      2 AS x
    FROM
      t_4_R_r3 AS R_r3
    WHERE
      (R_r3.x = 1)
   UNION ALL
  
    SELECT
      x_45 AS x
    FROM
      UNNEST(ARRAY[1]) as x_45
    WHERE
      (x_45 > 5)
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_r4 AS (SELECT
  R_MultBodyAggAux_recursive_head_f5.x AS x
FROM
  t_2_R_MultBodyAggAux_recursive_head_f5 AS R_MultBodyAggAux_recursive_head_f5
GROUP BY x),
t_0_R_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      2 AS x
    FROM
      t_1_R_r4 AS R_r4
    WHERE
      (R_r4.x = 1)
   UNION ALL
  
    SELECT
      x_47 AS x
    FROM
      UNNEST(ARRAY[1]) as x_47
    WHERE
      (x_47 > 5)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_recursive_head_f6.x AS x
FROM
  t_0_R_MultBodyAggAux_recursive_head_f6 AS R_MultBodyAggAux_recursive_head_f6
GROUP BY x ORDER BY x NULLS LAST;