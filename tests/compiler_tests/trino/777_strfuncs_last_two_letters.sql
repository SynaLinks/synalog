SELECT
  x_3 AS w,
  SUBSTR(x_3, ((LENGTH(x_3)) - (1)), 2) AS l
FROM
  UNNEST(ARRAY['Apple', 'kiwi', 'Banana']) as pushkin(x_3) ORDER BY w;