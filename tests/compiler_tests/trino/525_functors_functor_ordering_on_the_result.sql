SELECT
  ((2) * (x_2)) AS y
FROM
  UNNEST(ARRAY[1, 2]) as pushkin(x_2) ORDER BY y desc;