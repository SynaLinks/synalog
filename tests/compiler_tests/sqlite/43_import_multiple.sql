SELECT
  x_11.value AS x,
  ((x_11.value) * (2)) AS doubled
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4, 5)) as x_11
WHERE
  (x_11.value > 0) ORDER BY x;