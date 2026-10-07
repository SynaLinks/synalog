SELECT
  (((x_2.value) - (2) * CAST((x_2.value) / NULLIF(2, 0) AS INTEGER))) AS k,
  SUM(1) AS n
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4, 5)) as x_2
GROUP BY (((x_2.value) - (2) * CAST((x_2.value) / NULLIF(2, 0) AS INTEGER))) ORDER BY k NULLS LAST;