SELECT
  x_1 AS x
FROM
  UNNEST(FILTER(SEQUENCE(0, 1), x -> x < 1)) as pushkin(x_1);
