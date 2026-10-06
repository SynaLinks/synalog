SELECT
  x_1 AS p
FROM
  UNNEST(TRANSFORM(SPLIT('c,a,b', ','), synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY p;