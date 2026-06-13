SELECT
  x_8.value AS col0,
  CASE WHEN (x_8.value < 3) THEN ((x_8.value) * (2)) WHEN (x_8.value < 6) THEN ((x_8.value) + (10)) ELSE ((((x_8.value) * (x_8.value))) - (20)) END AS col1
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_8 ORDER BY col0;