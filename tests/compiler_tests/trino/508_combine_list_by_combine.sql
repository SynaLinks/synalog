SELECT
  CARDINALITY((SELECT
  ARRAY_AGG(x_3) AS logica_value
FROM
  UNNEST(ARRAY[1, 2, 3]) as pushkin(x_3))) AS n;