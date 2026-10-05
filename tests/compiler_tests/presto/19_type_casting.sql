SELECT
  x_8 AS col0,
  CAST(x_8 AS VARCHAR) AS col1
FROM
  UNNEST(FILTER(SEQUENCE(0, 5), x -> x < 5)) as pushkin(x_8) ORDER BY col0;