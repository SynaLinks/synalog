SELECT
  SUM(x_0.value) AS s
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 0) select n from t) where n < 0)) as x_0;