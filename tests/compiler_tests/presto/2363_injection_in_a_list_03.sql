SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY[''') UNION SELECT 1 --', 'other']) as pushkin(x_1)
WHERE
  (x_1 != 'other');