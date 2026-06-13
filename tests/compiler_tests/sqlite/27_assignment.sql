SELECT
  x_8.value AS col0,
  ((x_8.value) + (1)) AS col1
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 5) select n from t) where n < 5)) as x_8 ORDER BY col0;