WITH RECURSIVE t_1_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_27.value) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_27
      WHERE
        (0 < 22) AND
        (1 = 0) AND
        (x_27.value = 0)
     UNION ALL
    
      SELECT
        ((x_43.value) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_43, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_49
      WHERE
        (((0) + (1)) < 22) AND
        (0 < 22) AND
        (1 = 0) AND
        (x_43.value IS ((x_49.value) + (1))) AND
        (x_49.value = 0)
     UNION ALL
    
      SELECT
        ((x_65.value) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_65, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_72, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_78
      WHERE
        (((((0) + (1))) + (1)) < 22) AND
        (((0) + (1)) < 22) AND
        (0 < 22) AND
        (1 = 0) AND
        (x_65.value IS ((x_72.value) + (1))) AND
        (x_72.value IS ((x_78.value) + (1))) AND
        (x_78.value = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_85.value) + (1)) AS y,
  ((t_15_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_15_Reach_RecursiveCte, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_85
WHERE
  (t_15_Reach_RecursiveCte.synalog_step < 22) AND
  (t_15_Reach_RecursiveCte.y IS x_85.value)),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.y AS y
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.y)
SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(10, 22, 23)) as x_3
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_6.value)) AS synalog_value
  FROM
    t_0_Reach AS Reach, JSON_EACH(JSON_ARRAY(0)) as x_6
  WHERE
    (Reach.y IS x_3.value)) IS NULL) ORDER BY x NULLS LAST;