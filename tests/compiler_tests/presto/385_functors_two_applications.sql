SELECT
  SUM(x_2) AS t
FROM
  UNNEST(TRANSFORM(ARRAY[10, 20], synalog_e -> ROW(synalog_e))) as pushkin(x_2);