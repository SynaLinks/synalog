SELECT
  x_7 AS x,
  ((x_7) * (x_7)) AS squared
FROM
  UNNEST(GENERATE_ARRAY(0, 5 - 1)) as x_7
WHERE
  (x_7 > 1) ORDER BY x;