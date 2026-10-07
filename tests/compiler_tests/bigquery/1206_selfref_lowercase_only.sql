SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY["a", "B", "c"]) as x_1
WHERE
  (x_1 = LOWER(x_1)) ORDER BY s;