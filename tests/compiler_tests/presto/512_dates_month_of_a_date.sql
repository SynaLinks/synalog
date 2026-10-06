SELECT
  SUBSTR(x_2, 1, 7) AS m,
  SUM(1) AS n
FROM
  UNNEST(TRANSFORM(ARRAY['2024-01-03', '2024-01-20', '2024-02-11'], synalog_e -> ROW(synalog_e))) as pushkin(x_2)
GROUP BY 1 ORDER BY m;