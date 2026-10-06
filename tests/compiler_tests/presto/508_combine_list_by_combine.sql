SELECT
  CARDINALITY((SELECT
  ARRAY_AGG(x_3) AS logica_value
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_3))) AS n;