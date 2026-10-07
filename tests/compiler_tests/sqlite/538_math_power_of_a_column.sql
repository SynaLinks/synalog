SELECT
  x_3.value AS x,
  (POW(x_3.value, 2)) AS p
FROM
  JSON_EACH(JSON_ARRAY(2, 3)) as x_3 ORDER BY x;