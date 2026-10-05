SELECT
  x_8 AS col0,
  ((x_8) + (1)) AS col1
FROM
  UNNEST(FILTER(SEQUENCE(0, 5), x -> x < 5)) as pushkin(x_8) ORDER BY col0;