SELECT
  x_11.value AS x,
  (POW(x_11.value, 2)) AS squared,
  (POW(x_11.value, 3)) AS cubed
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_11
WHERE
  (x_11.value > 0) AND
  (x_11.value < 5) ORDER BY x;