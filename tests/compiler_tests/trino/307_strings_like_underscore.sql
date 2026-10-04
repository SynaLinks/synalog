SELECT
  x_3 AS w
FROM
  UNNEST(ARRAY['abc', 'abbc', 'ac']) as pushkin(x_3)
WHERE
  (x_3 LIKE 'a_c') ORDER BY w;