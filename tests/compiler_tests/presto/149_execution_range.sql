SELECT
  x_1 AS x
FROM
  UNNEST(SEQUENCE(0, 3 - 1)) as pushkin(x_1) ORDER BY x;