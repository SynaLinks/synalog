SELECT
  x_1 AS x,
  'one' AS label
FROM
  UNNEST(ARRAY[1]) as pushkin(x_1);