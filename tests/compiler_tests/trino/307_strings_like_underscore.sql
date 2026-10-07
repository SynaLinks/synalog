SELECT
  x_3 AS w
FROM
  UNNEST(TRANSFORM(ARRAY['abc', 'abbc', 'ac'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 LIKE 'a_c' ESCAPE '\') ORDER BY w;