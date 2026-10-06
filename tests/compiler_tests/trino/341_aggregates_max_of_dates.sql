SELECT
  MAX(x_2) AS m
FROM
  UNNEST(TRANSFORM(ARRAY['2023-12-31', '2024-03-01', '2024-01-15'], synalog_e -> ROW(synalog_e))) as pushkin(x_2);