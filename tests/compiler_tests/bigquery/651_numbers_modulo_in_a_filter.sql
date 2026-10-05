SELECT
  x_1 AS x
FROM
  UNNEST(GENERATE_ARRAY(0, 10 - 1)) as x_1
WHERE
  ((MOD(x_1, 3)) = 0) AND
  (x_1 > 0) ORDER BY x;