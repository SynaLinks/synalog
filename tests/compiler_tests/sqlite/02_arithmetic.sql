SELECT
  x_15.value AS x,
  ((x_15.value) + (5)) AS plus,
  ((x_15.value) - (3)) AS sub,
  ((x_15.value) * (2)) AS mul
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_15
WHERE
  (x_15.value > 0) ORDER BY x;