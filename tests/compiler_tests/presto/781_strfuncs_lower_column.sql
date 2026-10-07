SELECT
  x_3 AS w,
  LOWER(x_3) AS u
FROM
  UNNEST(TRANSFORM(ARRAY['Apple', 'kiwi', 'Banana'], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY w;