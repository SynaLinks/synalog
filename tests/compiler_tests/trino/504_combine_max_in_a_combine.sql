SELECT
  (SELECT
  MAX(x_4) AS logica_value
FROM
  UNNEST(TRANSFORM(ARRAY[4, 9, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_4)) AS m;