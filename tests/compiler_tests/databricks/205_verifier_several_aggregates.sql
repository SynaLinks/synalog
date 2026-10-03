SELECT
  x_5 AS c,
  SUM(x_6) AS total,
  SUM(1) AS n,
  MAX(x_6) AS top,
  MIN(x_6) AS low
FROM
  explode(ARRAY("a", "b")) AS pushkin(x_5), explode(ARRAY(1, 2)) AS pushkin(x_6)
GROUP BY 1 ORDER BY c;