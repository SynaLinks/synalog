SELECT
  x_3 AS w
FROM
  UNNEST(TRANSFORM(ARRAY['abc', 'axyzc', 'abd'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 LIKE 'a%c' ESCAPE '\') ORDER BY w;