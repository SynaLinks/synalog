SELECT
  CASE WHEN (x_2 > 5) THEN 'big' ELSE 'small' END AS size,
  SUM(1) AS n
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3, 10, 20], synalog_e -> ROW(synalog_e))) as pushkin(x_2)
GROUP BY 1 ORDER BY size;