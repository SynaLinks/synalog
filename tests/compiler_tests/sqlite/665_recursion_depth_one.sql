WITH t_2_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.y AS y
FROM
  t_2_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY R_MultBodyAggAux_recursive_head_f1.y),
t_0_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      t_1_R_r0 AS R_r0, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_7
    WHERE
      (R_r0.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_recursive_head_f2.y AS y
FROM
  t_0_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY R_MultBodyAggAux_recursive_head_f2.y ORDER BY y NULLS LAST;