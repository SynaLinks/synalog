SELECT
  x_7.value AS x,
  ((x_7.value) * (x_7.value)) AS squared
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 5) select n from t) where n < 5)) as x_7
WHERE
  (x_7.value > 1) ORDER BY x;