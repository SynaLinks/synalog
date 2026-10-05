SELECT
  MIN(x_2) AS v
FROM
  UNNEST(ARRAY[4, 1, 7, 1]) as pushkin(x_2);