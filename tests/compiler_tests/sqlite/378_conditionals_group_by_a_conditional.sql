SELECT
  CASE WHEN (x_2.value > 5) THEN 'big' ELSE 'small' END AS size,
  SUM(1) AS n
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 10, 20)) as x_2
GROUP BY CASE WHEN (x_2.value > 5) THEN 'big' ELSE 'small' END ORDER BY size;