SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY["a", ""]) as x_1 ORDER BY s;