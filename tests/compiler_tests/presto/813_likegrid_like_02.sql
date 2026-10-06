SELECT
  x_3 AS w
FROM
  UNNEST(TRANSFORM(ARRAY['cat', 'cart', 'scat', 'Cat', 'ct', 'c_t'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 LIKE '%t' ESCAPE '\') ORDER BY w;