SELECT
  x_3 AS x,
  (MOD(x_3, NULLIF(3, 0))) AS r
FROM
  UNNEST(TRANSFORM(ARRAY[-7, 7], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY x;