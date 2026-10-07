SELECT
  x_3 AS w
FROM
  UNNEST(TRANSFORM(ARRAY['cake', 'bakery', 'cookie'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 LIKE '%a_e%' ESCAPE '\') ORDER BY w;