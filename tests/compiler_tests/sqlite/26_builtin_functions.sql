SELECT
  x_10.value AS col0,
  ABS(((x_10.value) - (5))) AS col1
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_10
WHERE
  (x_10.value > 0) ORDER BY col0;