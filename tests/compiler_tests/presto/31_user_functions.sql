SELECT
  x_11 AS x,
  ((x_11) * (x_11)) AS sq
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 5), x -> x < 5), synalog_e -> ROW(synalog_e))) as pushkin(x_11) ORDER BY x;