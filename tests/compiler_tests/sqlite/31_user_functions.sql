SELECT
  x_11.value AS x,
  ((x_11.value) * (x_11.value)) AS sq
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 5) select n from t) where n < 5)) as x_11 ORDER BY x;