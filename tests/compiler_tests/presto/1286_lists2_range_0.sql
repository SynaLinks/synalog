SELECT
  x_1 AS x
FROM
  UNNEST(FILTER(SEQUENCE(0, 0), x -> x < 0)) as pushkin(x_1) ORDER BY x;
