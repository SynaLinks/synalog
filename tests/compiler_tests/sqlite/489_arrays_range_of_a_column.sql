SELECT
  x_5.value AS n,
  x_3.value AS i
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_5, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < x_5.value) select n from t) where n < x_5.value)) as x_3 ORDER BY n, i;