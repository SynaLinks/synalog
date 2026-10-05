SELECT
  x_3 AS w
FROM
  UNNEST(ARRAY['Apple', 'kiwi', 'Banana']) as pushkin(x_3)
WHERE
  (x_3 LIKE '%na');