SELECT
  SUM(x_2) AS v
FROM
  UNNEST(TRANSFORM(ARRAY[4, 1, 7, 1], synalog_e -> ROW(synalog_e))) as pushkin(x_2);