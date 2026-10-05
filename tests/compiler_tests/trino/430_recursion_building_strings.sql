WITH t_10_W_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_9_W_r0 AS (SELECT
  W_MultBodyAggAux_recursive_head_f1.w AS w
FROM
  t_10_W_MultBodyAggAux_recursive_head_f1 AS W_MultBodyAggAux_recursive_head_f1
GROUP BY 1),
t_8_W_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(W_r0.w, 'a')) AS w
    FROM
      t_9_W_r0 AS W_r0
    WHERE
      (LENGTH(W_r0.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_7_W_r1 AS (SELECT
  W_MultBodyAggAux_recursive_head_f2.w AS w
FROM
  t_8_W_MultBodyAggAux_recursive_head_f2 AS W_MultBodyAggAux_recursive_head_f2
GROUP BY 1),
t_6_W_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(W_r1.w, 'a')) AS w
    FROM
      t_7_W_r1 AS W_r1
    WHERE
      (LENGTH(W_r1.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_5_W_r2 AS (SELECT
  W_MultBodyAggAux_recursive_head_f3.w AS w
FROM
  t_6_W_MultBodyAggAux_recursive_head_f3 AS W_MultBodyAggAux_recursive_head_f3
GROUP BY 1),
t_4_W_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(W_r2.w, 'a')) AS w
    FROM
      t_5_W_r2 AS W_r2
    WHERE
      (LENGTH(W_r2.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_3_W_r3 AS (SELECT
  W_MultBodyAggAux_recursive_head_f4.w AS w
FROM
  t_4_W_MultBodyAggAux_recursive_head_f4 AS W_MultBodyAggAux_recursive_head_f4
GROUP BY 1),
t_2_W_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(W_r3.w, 'a')) AS w
    FROM
      t_3_W_r3 AS W_r3
    WHERE
      (LENGTH(W_r3.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_1_W_r4 AS (SELECT
  W_MultBodyAggAux_recursive_head_f5.w AS w
FROM
  t_2_W_MultBodyAggAux_recursive_head_f5 AS W_MultBodyAggAux_recursive_head_f5
GROUP BY 1),
t_0_W_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      (CONCAT(W_r4.w, 'a')) AS w
    FROM
      t_1_W_r4 AS W_r4
    WHERE
      (LENGTH(W_r4.w) < 3)
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W_MultBodyAggAux_recursive_head_f6.w AS w
FROM
  t_0_W_MultBodyAggAux_recursive_head_f6 AS W_MultBodyAggAux_recursive_head_f6
GROUP BY 1 ORDER BY w;