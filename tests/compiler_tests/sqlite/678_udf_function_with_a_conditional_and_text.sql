SELECT
  x_7.value AS n,
  ((CAST(x_7.value AS TEXT)) || (CASE WHEN (x_7.value = 1) THEN 'st' WHEN (x_7.value = 2) THEN 'nd' ELSE 'th' END)) AS o
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 4)) as x_7 ORDER BY n;