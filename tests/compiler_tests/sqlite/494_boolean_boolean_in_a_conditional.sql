SELECT
  x_6.value AS x,
  CASE WHEN (x_6.value > 2) THEN 'big' ELSE 'small' END AS w
FROM
  JSON_EACH(JSON_ARRAY(1, 3)) as x_6 ORDER BY x;