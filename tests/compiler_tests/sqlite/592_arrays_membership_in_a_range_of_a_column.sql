SELECT
  2 AS n,
  x_3.value AS i
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 2) select n from t) where n < 2)) as x_3 ORDER BY i;