SELECT
  (SELECT
  SUM(x_4) AS logica_value
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_4)) AS t;