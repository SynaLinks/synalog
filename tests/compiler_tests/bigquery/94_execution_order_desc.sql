SELECT
  x_3 AS s
FROM
  UNNEST(ARRAY["b", "a", "c"]) as x_3 ORDER BY s DESC;