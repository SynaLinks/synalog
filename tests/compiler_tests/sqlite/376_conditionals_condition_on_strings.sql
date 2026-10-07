SELECT
  x_3.value AS s,
  CASE WHEN (x_3.value < 'h') THEN 'early' ELSE 'late' END AS w
FROM
  JSON_EACH(JSON_ARRAY('a', 'm')) as x_3 ORDER BY s;