SELECT
  x_4.value AS x,
  CASE WHEN (x_4.value < 0) THEN - x_4.value ELSE x_4.value END AS a
FROM
  JSON_EACH(JSON_ARRAY(2, -3)) as x_4 ORDER BY x;