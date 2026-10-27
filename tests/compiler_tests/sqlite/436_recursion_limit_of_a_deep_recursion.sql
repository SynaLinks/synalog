WITH RECURSIVE t_0_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_20.value) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_20
      WHERE
        (0 < 25) AND
        (1 = 0) AND
        (x_20.value = 0)
     UNION ALL
    
      SELECT
        ((x_36.value) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_36, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_42
      WHERE
        (((0) + (1)) < 25) AND
        (0 < 25) AND
        (1 = 0) AND
        (x_36.value IS ((x_42.value) + (1))) AND
        (x_42.value = 0)
     UNION ALL
    
      SELECT
        ((x_58.value) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_58, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_65, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_71
      WHERE
        (((((0) + (1))) + (1)) < 25) AND
        (((0) + (1)) < 25) AND
        (0 < 25) AND
        (1 = 0) AND
        (x_58.value IS ((x_65.value) + (1))) AND
        (x_65.value IS ((x_71.value) + (1))) AND
        (x_71.value = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_78.value) + (1)) AS y,
  ((t_14_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_R_RecursiveCte AS t_14_R_RecursiveCte, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_78
WHERE
  (t_14_R_RecursiveCte.synalog_step < 25) AND
  (t_14_R_RecursiveCte.y IS x_78.value))
SELECT
  R_RecursiveCte.y AS y
FROM
  t_0_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.y ORDER BY y desc LIMIT 2;