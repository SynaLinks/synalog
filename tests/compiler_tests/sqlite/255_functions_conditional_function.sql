SELECT
  SIGN(x_4.value) AS s,
  x_4.value AS x
FROM
  JSON_EACH(JSON_ARRAY(5, -5)) as x_4 ORDER BY x;