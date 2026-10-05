SELECT
  1 AS x
FROM
  UNNEST(ARRAY[1, 2]) as pushkin(x_3)
WHERE
  (1 != 1.0E0) AND
  (x_3 = 1);
