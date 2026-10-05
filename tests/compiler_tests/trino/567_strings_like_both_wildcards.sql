SELECT
  x_3 AS w
FROM
  UNNEST(ARRAY['cake', 'bakery', 'cookie']) as pushkin(x_3)
WHERE
  (x_3 LIKE '%a_e%') ORDER BY w;