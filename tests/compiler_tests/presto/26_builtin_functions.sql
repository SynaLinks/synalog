SELECT
  x_10 AS col0,
  ABS(((x_10) - (5))) AS col1
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 10), x -> x < 10), synalog_e -> ROW(synalog_e))) as pushkin(x_10)
WHERE
  (x_10 > 0) ORDER BY col0;