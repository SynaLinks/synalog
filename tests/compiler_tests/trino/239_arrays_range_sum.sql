SELECT
  SUM(x_0) AS t
FROM
  UNNEST(SEQUENCE(0, 5 - 1)) as pushkin(x_0);