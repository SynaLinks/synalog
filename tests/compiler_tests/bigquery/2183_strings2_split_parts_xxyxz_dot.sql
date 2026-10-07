SELECT
  x_1 AS part
FROM
  UNNEST(SPLIT("x.y.z", ".")) as x_1
GROUP BY part ORDER BY part;