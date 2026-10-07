SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY["2", "10", "1"]) as x_1 ORDER BY s;