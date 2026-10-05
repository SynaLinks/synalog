SELECT
  x_1 AS x
FROM
  UNNEST(FILTER(SEQUENCE(0, 4), x -> x < 4)) as pushkin(x_1) ORDER BY x;
