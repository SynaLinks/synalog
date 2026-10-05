SELECT
  2 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as pushkin(x_3)
WHERE
  (x_3 = 2) AND
  (2 = 2.0E0);
