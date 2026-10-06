SELECT
  CAST(ROW(x_1) AS ROW(n double)).n AS n
FROM
  UNNEST(TRANSFORM(ARRAY[10, 9], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY n;