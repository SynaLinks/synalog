SELECT
  x_10 AS col0,
  ABS(((x_10) - (5))) AS col1
FROM
  UNNEST(GENERATE_ARRAY(0, 10 - 1)) as x_10
WHERE
  (x_10 > 0) ORDER BY col0;