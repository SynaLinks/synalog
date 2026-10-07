SELECT
  x_1 AS part
FROM
  UNNEST(SPLIT("abc", ",")) as x_1
GROUP BY part;