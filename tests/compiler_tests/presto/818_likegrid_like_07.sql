SELECT
  x_3 AS w
FROM
  UNNEST(ARRAY['cat', 'cart', 'scat', 'Cat', 'ct', 'c_t']) as pushkin(x_3)
WHERE
  (x_3 LIKE '_a_' ESCAPE '\') ORDER BY w;
