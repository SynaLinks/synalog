SELECT
  (SELECT
  SUM(1) AS logica_value
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_5), UNNEST(TRANSFORM(ARRAY[2, 3, 4], synalog_e -> ROW(synalog_e))) as pushkin(x_7)
WHERE
  (x_7 = x_5)) AS n;