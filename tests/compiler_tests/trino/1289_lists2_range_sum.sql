SELECT
  SUM(x_0) AS s
FROM
  UNNEST(FILTER(SEQUENCE(0, 10), x -> x < 10)) as pushkin(x_0);
