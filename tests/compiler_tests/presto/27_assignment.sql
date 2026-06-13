SELECT
  x_8 AS col0,
  ((x_8) + (1)) AS col1
FROM
  UNNEST(SEQUENCE(0, 5 - 1)) as pushkin(x_8) ORDER BY col0;