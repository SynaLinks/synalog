SELECT
  x_3.value AS m,
  CASE WHEN (x_3.value = 2) THEN CASE WHEN ((((((1900) - (4) * CAST((1900) / NULLIF(4, 0) AS INTEGER))) = 0) AND ((((1900) - (100) * CAST((1900) / NULLIF(100, 0) AS INTEGER))) != 0)) OR ((((1900) - (400) * CAST((1900) / NULLIF(400, 0) AS INTEGER))) = 0)) THEN 29 ELSE 28 END ELSE JSON_EXTRACT(JSON_ARRAY(31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31), '$[' || ((x_3.value) - (1)) || ']') END AS n
FROM
  JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 13) select n from t) where n < 13)) as x_3
WHERE
  (x_3.value > 0) ORDER BY m NULLS LAST;