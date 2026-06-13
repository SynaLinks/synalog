WITH t_0_Sorted AS (SELECT
  x_5.value AS col0
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 20) select n from t) where n < 20)) as x_5
WHERE
  (((x_5.value) % (2)) = 0) ORDER BY col0),
t_0_Top5 AS (SELECT
  x_5.value AS col0
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 20) select n from t) where n < 20)) as x_5 ORDER BY col0 LIMIT 5),
t_0_TopEven AS (SELECT
  x_5.value AS col0
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 20) select n from t) where n < 20)) as x_5
WHERE
  (((x_5.value) % (2)) = 0) ORDER BY col0 LIMIT 3)
SELECT * FROM (
  
    SELECT
      'sorted' AS col0,
      Sorted.col0 AS col1
    FROM
      t_0_Sorted AS Sorted
   UNION ALL
  
    SELECT
      'top5' AS col0,
      Top5.col0 AS col1
    FROM
      t_0_Top5 AS Top5
   UNION ALL
  
    SELECT
      'top_even' AS col0,
      TopEven.col0 AS col1
    FROM
      t_0_TopEven AS TopEven
  
) AS UNUSED_TABLE_NAME  ORDER BY col0, col1 ;