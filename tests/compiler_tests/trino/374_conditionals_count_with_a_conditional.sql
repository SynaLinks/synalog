SELECT
  SUM(CASE WHEN (x_2 > 2) THEN 1 ELSE 0 END) AS n
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3, 4], synalog_e -> ROW(synalog_e))) as pushkin(x_2);