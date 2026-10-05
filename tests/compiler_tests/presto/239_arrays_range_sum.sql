SELECT
  SUM(x_0) AS t
FROM
  UNNEST(FILTER(SEQUENCE(0, 5), x -> x < 5)) as pushkin(x_0);