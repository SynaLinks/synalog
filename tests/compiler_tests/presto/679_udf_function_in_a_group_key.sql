SELECT
  CASE WHEN (x_6 > 5) THEN 'big' ELSE 'small' END AS s,
  SUM(1) AS n
FROM
  UNNEST(TRANSFORM(ARRAY[1, 7, 9], synalog_e -> ROW(synalog_e))) as pushkin(x_6)
GROUP BY 1 ORDER BY s;