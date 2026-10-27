WITH RECURSIVE t_2_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_25.value) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_25
      WHERE
        (0 < 21) AND
        (1 = 0) AND
        (x_25.value = 0)
     UNION ALL
    
      SELECT
        ((x_41.value) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_41, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_47
      WHERE
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_41.value IS ((x_47.value) + (1))) AND
        (x_47.value = 0)
     UNION ALL
    
      SELECT
        ((x_63.value) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_63, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_70, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_76
      WHERE
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_63.value IS ((x_70.value) + (1))) AND
        (x_70.value IS ((x_76.value) + (1))) AND
        (x_76.value = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_83.value) + (1)) AS y,
  ((t_16_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_2_Reach_RecursiveCte AS t_16_Reach_RecursiveCte, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_83
WHERE
  (t_16_Reach_RecursiveCte.synalog_step < 21) AND
  (t_16_Reach_RecursiveCte.y IS x_83.value)),
t_1_Reach AS (SELECT
  Reach_RecursiveCte.y AS y
FROM
  t_2_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.y),
t_0_Far AS (SELECT
  MAX(Reach.y) AS m
FROM
  t_1_Reach AS Reach),
t_18_Count AS (SELECT
  SUM(1) AS n
FROM
  t_1_Reach AS t_19_Reach)
SELECT
  Far.m AS m,
  Count.n AS n
FROM
  t_0_Far AS Far, t_18_Count AS Count;