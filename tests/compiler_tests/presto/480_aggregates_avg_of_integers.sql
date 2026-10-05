SELECT
  AVG(x_2) AS a
FROM
  UNNEST(ARRAY[1, 2]) as pushkin(x_2);