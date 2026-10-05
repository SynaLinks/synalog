SELECT
  x_2 AS a,
  x_3 AS b
FROM
  UNNEST(FILTER(SEQUENCE(0, 4), x -> x < 4)) as pushkin(x_2), UNNEST(FILTER(SEQUENCE(0, 4), x -> x < 4)) as pushkin(x_3)
WHERE
  (x_2 < x_3) ORDER BY a, b;
