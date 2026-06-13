SELECT
  x_8.value AS score,
  CASE WHEN (x_8.value >= 12) THEN 'A' WHEN (x_8.value >= 9) THEN 'B' WHEN (x_8.value >= 6) THEN 'C' WHEN (x_8.value >= 3) THEN 'D' ELSE 'F' END AS letter
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 15) select n from t) where n < 15)) as x_8 ORDER BY score;