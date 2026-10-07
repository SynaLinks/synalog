SELECT
  CASE WHEN (x_6.value > 5) THEN 'big' ELSE 'small' END AS s,
  SUM(1) AS n
FROM
  JSON_EACH(JSON_ARRAY(1, 7, 9)) as x_6
GROUP BY CASE WHEN (x_6.value > 5) THEN 'big' ELSE 'small' END ORDER BY s NULLS LAST;