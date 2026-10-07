SELECT
  x_1 AS part
FROM
  UNNEST(SPLIT("a b  c", " ")) as x_1
GROUP BY part ORDER BY part;