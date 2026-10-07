WITH t_15_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_14_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_15_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY x),
t_17_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_12_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_13_E.b AS x
    FROM
      t_14_R_r0 AS R_r0, t_17_E AS t_13_E
    WHERE
      (t_13_E.a = R_r0.x)
  
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
      t_10_E.b AS x
    FROM
      t_11_R_r1 AS R_r1, t_17_E AS t_10_E
    WHERE
      (t_10_E.a = R_r1.x)
  
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
      t_7_E.b AS x
    FROM
      t_8_R_r2 AS R_r2, t_17_E AS t_7_E
    WHERE
      (t_7_E.a = R_r2.x)
  
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
      t_4_E.b AS x
    FROM
      t_5_R_r3 AS R_r3, t_17_E AS t_4_E
    WHERE
      (t_4_E.a = R_r3.x)
  
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
      E.b AS x
    FROM
      t_2_R_r4 AS R_r4, t_17_E AS E
    WHERE
      (E.a = R_r4.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R AS (SELECT
  R_MultBodyAggAux_recursive_head_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_recursive_head_f6 AS R_MultBodyAggAux_recursive_head_f6
GROUP BY x)
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 5]) as x_3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_R AS R
  WHERE
    (R.x = x_3)) IS NULL);