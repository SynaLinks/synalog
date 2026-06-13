SELECT
  x_11 AS x,
  (POW(x_11, 2)) AS squared,
  (POW(x_11, 3)) AS cubed
FROM
  UNNEST(GENERATE_ARRAY(0, 10 - 1)) as x_11
WHERE
  (x_11 > 0) AND
  (x_11 < 5) ORDER BY x;