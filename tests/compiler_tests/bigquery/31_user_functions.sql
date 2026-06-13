SELECT
  x_11 AS x,
  ((x_11) * (x_11)) AS sq
FROM
  UNNEST(GENERATE_ARRAY(0, 5 - 1)) as x_11 ORDER BY x;