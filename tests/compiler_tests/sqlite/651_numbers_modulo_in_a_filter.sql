SELECT
  x_1.value AS x
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_1
WHERE
  (((x_1.value) % (3)) = 0) AND
  (x_1.value > 0) ORDER BY x;