SELECT
  x_3 AS d,
  (CONCAT(SUBSTR(x_3, 1, 7), '-01')) AS p
FROM
  UNNEST(TRANSFORM(ARRAY['2024-03-09', '2023-11-30', '2024-01-15'], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY d;