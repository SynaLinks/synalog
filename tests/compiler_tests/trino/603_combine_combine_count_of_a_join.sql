SELECT
  (SELECT
  SUM(1) AS synalog_value
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_5), UNNEST(TRANSFORM(ARRAY[2, 3, 4], synalog_e -> ROW(synalog_e))) as pushkin(x_7)
WHERE
  (x_7 IS NOT DISTINCT FROM x_5)) AS n;