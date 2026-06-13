SELECT
  x_8.value AS x,
  CASE WHEN (x_8.value > 7) THEN 'very_high' WHEN (x_8.value > 4) THEN 'high' WHEN (x_8.value > 1) THEN 'medium' ELSE 'low' END AS cat
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 10) select n from t) where n < 10)) as x_8 ORDER BY x;