SELECT
  x_11 AS x,
  ((x_11) * (x_11)) AS sq
FROM
  UNNEST(SEQUENCE(0, 5 - 1)) as pushkin(x_11) ORDER BY x;