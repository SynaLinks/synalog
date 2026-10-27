WITH RECURSIVE t_1_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_21.value) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_21
      WHERE
        (0 < 40) AND
        (1 = 0) AND
        (x_21.value = 0)
     UNION ALL
    
      SELECT
        ((x_37.value) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_37, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_43
      WHERE
        (((0) + (1)) < 40) AND
        (0 < 40) AND
        (1 = 0) AND
        (x_37.value IS ((x_43.value) + (1))) AND
        (x_43.value = 0)
     UNION ALL
    
      SELECT
        ((x_59.value) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_59, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_66, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_72
      WHERE
        (((((0) + (1))) + (1)) < 40) AND
        (((0) + (1)) < 40) AND
        (0 < 40) AND
        (1 = 0) AND
        (x_59.value IS ((x_66.value) + (1))) AND
        (x_66.value IS ((x_72.value) + (1))) AND
        (x_72.value = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_79.value) + (1)) AS y,
  ((t_15_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_15_Reach_RecursiveCte, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_79
WHERE
  (t_15_Reach_RecursiveCte.synalog_step < 40) AND
  (t_15_Reach_RecursiveCte.y IS x_79.value)),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.y AS y
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.y)
SELECT
  MAX(Reach.y) AS m
FROM
  t_0_Reach AS Reach;