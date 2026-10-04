SELECT
  x_1 AS w
FROM
  UNNEST(ARRAY["b", "A", "a", "B"]) as x_1 ORDER BY w;