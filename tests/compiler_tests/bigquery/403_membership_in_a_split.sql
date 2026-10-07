SELECT
  x_1 AS p
FROM
  UNNEST(SPLIT("c,a,b", ",")) as x_1 ORDER BY p;