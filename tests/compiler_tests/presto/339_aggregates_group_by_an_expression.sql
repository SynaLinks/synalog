SELECT
  (MOD(x_2, NULLIF(2, 0))) AS k,
  SUM(1) AS n
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3, 4, 5], synalog_e -> ROW(synalog_e))) as pushkin(x_2)
GROUP BY 1 ORDER BY k;