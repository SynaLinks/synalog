SELECT
  x_4.value AS x,
  CASE WHEN (x_4.value > 100) THEN 'large' WHEN (x_4.value > 10) THEN 'medium' ELSE 'small' END AS size
FROM
  JSON_EACH(JSON_ARRAY(1, 50, 500)) as x_4 ORDER BY x;