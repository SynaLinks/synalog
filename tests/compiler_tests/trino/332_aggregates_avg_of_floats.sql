SELECT
  AVG(x_2) AS a
FROM
  UNNEST(ARRAY[0.25E0, 0.75E0]) as pushkin(x_2);