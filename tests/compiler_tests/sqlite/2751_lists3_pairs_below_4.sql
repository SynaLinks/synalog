SELECT
  SUM(1) AS c
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_0, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 4) select n from t) where n < 4)) as x_1
WHERE
  (x_0.value < x_1.value);