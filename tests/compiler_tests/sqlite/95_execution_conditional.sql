SELECT
  x_4.value AS x,
  CASE WHEN (x_4.value < 0) THEN 'neg' WHEN (x_4.value = 0) THEN 'zero' ELSE 'pos' END AS s
FROM
  JSON_EACH(JSON_ARRAY(3, -2, 0)) as x_4 ORDER BY x;