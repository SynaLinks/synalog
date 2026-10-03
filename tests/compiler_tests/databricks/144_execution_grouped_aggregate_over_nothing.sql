SELECT
  x_5 AS k,
  SUM(x_6) AS t
FROM
  explode(ARRAY("a")) AS pushkin(x_5), explode(ARRAY(1, 2)) AS pushkin(x_6)
WHERE
  (x_6 > 10)
GROUP BY 1;