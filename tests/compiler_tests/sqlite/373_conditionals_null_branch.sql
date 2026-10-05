SELECT
  x_3.value AS x,
  CASE WHEN (x_3.value < 2) THEN 'small' ELSE null END AS w
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_3 ORDER BY x;