SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY['\', 'other']) as pushkin(x_1)
WHERE
  (x_1 != 'other');