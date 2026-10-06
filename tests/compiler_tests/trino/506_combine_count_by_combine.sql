SELECT
  (SELECT
  SUM(1) AS logica_value
FROM
  UNNEST(TRANSFORM(ARRAY[5, 6, 7], synalog_e -> ROW(synalog_e))) as pushkin(x_4)) AS n;