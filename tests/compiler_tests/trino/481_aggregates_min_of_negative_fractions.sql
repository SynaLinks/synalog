SELECT
  MIN(x_2) AS m
FROM
  UNNEST(TRANSFORM(ARRAY[-1.5E0, -2.5E0, 0.5E0], synalog_e -> ROW(synalog_e))) as pushkin(x_2);