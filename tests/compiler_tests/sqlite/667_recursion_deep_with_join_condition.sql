WITH RECURSIVE t_3_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_23.value) + (2)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_23
      WHERE
        (((x_23.value) + (2)) < 25) AND
        (0 < 30) AND
        (1 = 0) AND
        (x_23.value = 0)
     UNION ALL
    
      SELECT
        ((x_39.value) + (2)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_39, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_45
      WHERE
        (((x_39.value) + (2)) < 25) AND
        (((0) + (1)) < 30) AND
        (((x_45.value) + (2)) < 25) AND
        (0 < 30) AND
        (1 = 0) AND
        (x_39.value IS ((x_45.value) + (2))) AND
        (x_45.value = 0)
     UNION ALL
    
      SELECT
        ((x_61.value) + (2)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_61, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_68, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_74
      WHERE
        (((x_61.value) + (2)) < 25) AND
        (((((0) + (1))) + (1)) < 30) AND
        (((x_68.value) + (2)) < 25) AND
        (((0) + (1)) < 30) AND
        (((x_74.value) + (2)) < 25) AND
        (0 < 30) AND
        (1 = 0) AND
        (x_61.value IS ((x_68.value) + (2))) AND
        (x_68.value IS ((x_74.value) + (2))) AND
        (x_74.value = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_81.value) + (2)) AS y,
  ((t_17_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_3_R_RecursiveCte AS t_17_R_RecursiveCte, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_81
WHERE
  (((x_81.value) + (2)) < 25) AND
  (t_17_R_RecursiveCte.synalog_step < 30) AND
  (t_17_R_RecursiveCte.y IS x_81.value)),
t_2_R AS (SELECT
  R_RecursiveCte.y AS y
FROM
  t_3_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.y),
t_1_M AS (SELECT
  MAX(R.y) AS m
FROM
  t_2_R AS R)
SELECT
  t_0_M.m AS m
FROM
  t_1_M AS t_0_M ORDER BY m NULLS LAST;