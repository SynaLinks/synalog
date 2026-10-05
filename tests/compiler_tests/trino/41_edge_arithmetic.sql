SELECT
  x_11 AS x,
  (POW(x_11, 2)) AS squared,
  (POW(x_11, 3)) AS cubed
FROM
  UNNEST(FILTER(SEQUENCE(0, 10), x -> x < 10)) as pushkin(x_11)
WHERE
  (x_11 > 0) AND
  (x_11 < 5) ORDER BY x;