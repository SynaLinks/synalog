SELECT
  SUM(x_2) AS t
FROM
  UNNEST(TRANSFORM(ARRAY[0.25E0, 0.25E0, 0.5E0], synalog_e -> ROW(synalog_e))) as pushkin(x_2);