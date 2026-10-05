SELECT
  x_3.value AS x,
  SIGN(x_3.value) AS s
FROM
  JSON_EACH(JSON_ARRAY(-2, 0, 5)) as x_3 ORDER BY x;