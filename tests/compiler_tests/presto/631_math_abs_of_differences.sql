SELECT
  x_5 AS a,
  x_7 AS b,
  ABS(((x_5) - (x_7))) AS d
FROM
  UNNEST(TRANSFORM(ARRAY[1, 4], synalog_e -> ROW(synalog_e))) as pushkin(x_5), UNNEST(TRANSFORM(ARRAY[1, 4], synalog_e -> ROW(synalog_e))) as pushkin(x_7)
WHERE
  (x_5 != x_7) ORDER BY a;