WITH t_0_P1 AS (SELECT
  ((((x_2.value) * (17))) % (39)) AS col0
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_2 ORDER BY col0),
t_0_P2 AS (SELECT
  x_5.value AS col0
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 20) select n from t) where n < 20)) as x_5 LIMIT 5),
t_0_P3 AS (SELECT
  x_5.value AS col0
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 20) select n from t) where n < 20)) as x_5
WHERE
  (((x_5.value) % (2)) = 0) ORDER BY col0 LIMIT 3)
SELECT * FROM (
  
    SELECT
      'ordered' AS col0,
      P1.col0 AS col1
    FROM
      t_0_P1 AS P1
   UNION ALL
  
    SELECT
      'limited' AS col0,
      P2.col0 AS col1
    FROM
      t_0_P2 AS P2
   UNION ALL
  
    SELECT
      'both' AS col0,
      P3.col0 AS col1
    FROM
      t_0_P3 AS P3
  
) AS UNUSED_TABLE_NAME  ORDER BY col0, col1 ;