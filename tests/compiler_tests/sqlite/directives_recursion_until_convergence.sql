WITH RECURSIVE t_0_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y
     UNION ALL
    
      SELECT
        ((x_13.value) + (1)) AS y
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_13
      WHERE
        (1 = 0) AND
        (x_13.value = 0)
     UNION ALL
    
      SELECT
        ((x_25.value) + (1)) AS y
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_25, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_29
      WHERE
        (1 = 0) AND
        (x_25.value IS ((x_29.value) + (1))) AND
        (x_29.value = 0)
     UNION ALL
    
      SELECT
        ((x_41.value) + (1)) AS y
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_41, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_47, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_51
      WHERE
        (1 = 0) AND
        (x_41.value IS ((x_47.value) + (1))) AND
        (x_47.value IS ((x_51.value) + (1))) AND
        (x_51.value = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_57.value) + (1)) AS y
FROM
  t_0_Reach_RecursiveCte AS t_14_Reach_RecursiveCte, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_57
WHERE
  (t_14_Reach_RecursiveCte.y IS x_57.value))
SELECT
  Reach_RecursiveCte.y AS y
FROM
  t_0_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.y ORDER BY y NULLS LAST;