SELECT
  SUBSTR(x_2, 1, 4) AS y,
  SUM(1) AS n
FROM
  UNNEST(TRANSFORM(ARRAY['2024-01-01', '2023-05-05', '2024-12-31'], synalog_e -> ROW(synalog_e))) as pushkin(x_2)
GROUP BY 1 ORDER BY y;