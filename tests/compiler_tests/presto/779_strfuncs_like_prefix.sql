SELECT
  x_3 AS w
FROM
  UNNEST(TRANSFORM(ARRAY['Apple', 'kiwi', 'Banana'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 LIKE 'A%' ESCAPE '\');