SELECT
  (x_2 > 3) AS big,
  SUM(1) AS n
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 5], synalog_e -> ROW(synalog_e))) as pushkin(x_2)
GROUP BY 1 ORDER BY big;