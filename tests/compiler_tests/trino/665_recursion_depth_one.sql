WITH t_2_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.y AS y
FROM
  t_2_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY 1),
t_0_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7) + (1)) AS y
    FROM
      t_1_R_r0 AS R_r0, UNNEST(FILTER(SEQUENCE(0, 10), x -> x < 10)) as pushkin(x_7)
    WHERE
      (R_r0.y = x_7)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_recursive_head_f2.y AS y
FROM
  t_0_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY 1 ORDER BY y;