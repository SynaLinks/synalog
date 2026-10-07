SELECT
  x_3 AS g,
  SUM(1) AS n
FROM
  UNNEST(ARRAY["a", "a", "b", "c", "c", "c"]) as x_3
GROUP BY g ORDER BY n desc LIMIT 2;