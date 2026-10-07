SELECT
  SUM(x_2) AS t
FROM
  UNNEST(TRANSFORM(ARRAY[0.1E0, 0.2E0, 0.3E0], synalog_e -> ROW(synalog_e))) as pushkin(x_2);