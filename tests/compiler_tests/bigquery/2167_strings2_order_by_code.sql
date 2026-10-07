SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY["b", "B", "a", "A", "_", "1", "é", "ab", "aB"]) as x_1 ORDER BY s;