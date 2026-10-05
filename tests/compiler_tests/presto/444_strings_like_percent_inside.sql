SELECT
  x_3 AS w
FROM
  UNNEST(ARRAY['abc', 'axyzc', 'abd']) as pushkin(x_3)
WHERE
  (x_3 LIKE 'a%c' ESCAPE '\') ORDER BY w;
