SELECT
  x_2 AS a,
  x_3 AS b
FROM
  UNNEST(GENERATE_ARRAY(0, 4 - 1)) as x_2, UNNEST(GENERATE_ARRAY(0, 4 - 1)) as x_3
WHERE
  (x_2 < x_3) ORDER BY a, b;