WITH RECURSIVE t_1_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        x_15.value AS x,
        ((x_15.value) + (1)) AS y,
        0 AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_15
     UNION ALL
    
      SELECT
        x_42.value AS x,
        ((x_36.value) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_36, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_42
      WHERE
        (0 < 21) AND
        (1 = 0) AND
        (x_36.value IS ((x_42.value) + (1)))
     UNION ALL
    
      SELECT
        x_78.value AS x,
        ((x_64.value) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_64, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_72, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_78
      WHERE
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_64.value IS ((x_72.value) + (1))) AND
        (x_72.value IS ((x_78.value) + (1)))
     UNION ALL
    
      SELECT
        x_123.value AS x,
        ((x_100.value) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_100, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_109, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_117, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_123
      WHERE
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_100.value IS ((x_109.value) + (1))) AND
        (x_109.value IS ((x_117.value) + (1))) AND
        (x_117.value IS ((x_123.value) + (1)))
     UNION ALL
    
      SELECT
        x_177.value AS x,
        ((x_145.value) + (1)) AS y,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_145, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_154, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_163, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_171, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_177
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 21) AND
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_145.value IS ((x_154.value) + (1))) AND
        (x_154.value IS ((x_163.value) + (1))) AND
        (x_163.value IS ((x_171.value) + (1))) AND
        (x_171.value IS ((x_177.value) + (1)))
     UNION ALL
    
      SELECT
        x_240.value AS x,
        ((x_199.value) + (1)) AS y,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_199, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_208, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_217, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_226, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_234, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_240
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 21) AND
        (((((((0) + (1))) + (1))) + (1)) < 21) AND
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_199.value IS ((x_208.value) + (1))) AND
        (x_208.value IS ((x_217.value) + (1))) AND
        (x_217.value IS ((x_226.value) + (1))) AND
        (x_226.value IS ((x_234.value) + (1))) AND
        (x_234.value IS ((x_240.value) + (1)))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_41_Reach_RecursiveCte.x AS x,
  ((x_249.value) + (1)) AS y,
  ((t_41_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_41_Reach_RecursiveCte, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_249
WHERE
  (t_41_Reach_RecursiveCte.synalog_step < 21) AND
  (t_41_Reach_RecursiveCte.y IS x_249.value)),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.x AS x,
  Reach_RecursiveCte.y AS y
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.x, Reach_RecursiveCte.y)
SELECT
  SUM(1) AS n
FROM
  t_0_Reach AS Reach;