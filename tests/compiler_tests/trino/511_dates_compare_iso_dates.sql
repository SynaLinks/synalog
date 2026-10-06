SELECT
  x_3 AS d
FROM
  UNNEST(TRANSFORM(ARRAY['2023-12-31', '2024-02-01', '2024-03-15'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 >= '2024-01-01') ORDER BY d;