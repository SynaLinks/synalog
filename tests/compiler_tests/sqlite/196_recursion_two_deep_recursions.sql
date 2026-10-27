WITH RECURSIVE t_3_A_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_22.value) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_22
      WHERE
        (0 < 21) AND
        (1 = 0) AND
        (x_22.value = 0)
     UNION ALL
    
      SELECT
        ((x_38.value) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_38, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_44
      WHERE
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_38.value IS ((x_44.value) + (1))) AND
        (x_44.value = 0)
     UNION ALL
    
      SELECT
        ((x_60.value) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_60, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_67, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_73
      WHERE
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_60.value IS ((x_67.value) + (1))) AND
        (x_67.value IS ((x_73.value) + (1))) AND
        (x_73.value = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_80.value) + (1)) AS y,
  ((t_17_A_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_3_A_RecursiveCte AS t_17_A_RecursiveCte, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_80
WHERE
  (t_17_A_RecursiveCte.synalog_step < 21) AND
  (t_17_A_RecursiveCte.y IS x_80.value)),
t_2_A AS (SELECT
  A_RecursiveCte.y AS y
FROM
  t_3_A_RecursiveCte AS A_RecursiveCte
GROUP BY A_RecursiveCte.y),
t_20_B_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_101.value) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_101
      WHERE
        (0 < 22) AND
        (1 = 0) AND
        (x_101.value = 0)
     UNION ALL
    
      SELECT
        ((x_117.value) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_117, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_123
      WHERE
        (((0) + (1)) < 22) AND
        (0 < 22) AND
        (1 = 0) AND
        (x_117.value IS ((x_123.value) + (1))) AND
        (x_123.value = 0)
     UNION ALL
    
      SELECT
        ((x_139.value) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_139, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_146, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_152
      WHERE
        (((((0) + (1))) + (1)) < 22) AND
        (((0) + (1)) < 22) AND
        (0 < 22) AND
        (1 = 0) AND
        (x_139.value IS ((x_146.value) + (1))) AND
        (x_146.value IS ((x_152.value) + (1))) AND
        (x_152.value = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_159.value) + (1)) AS y,
  ((t_35_B_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_20_B_RecursiveCte AS t_35_B_RecursiveCte, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 100) select n from t) where n < 100)) as x_159
WHERE
  (t_35_B_RecursiveCte.synalog_step < 22) AND
  (t_35_B_RecursiveCte.y IS x_159.value)),
t_19_B AS (SELECT
  B_RecursiveCte.y AS y
FROM
  t_20_B_RecursiveCte AS B_RecursiveCte
GROUP BY B_RecursiveCte.y)
SELECT
  MAX(t_0_A.y) AS a,
  MAX(t_1_B.y) AS b
FROM
  t_2_A AS t_0_A, t_19_B AS t_1_B;