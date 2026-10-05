SELECT
  x_3 AS w,
  SUBSTR(x_3, 1, 1) AS f
FROM
  UNNEST(ARRAY['Apple', 'kiwi', 'Banana']) as pushkin(x_3) ORDER BY w;