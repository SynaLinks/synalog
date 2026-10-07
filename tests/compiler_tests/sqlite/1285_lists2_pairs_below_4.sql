SELECT
  x_2.value AS a,
  x_3.value AS b
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_3
WHERE
  (x_2.value < x_3.value) ORDER BY a, b;