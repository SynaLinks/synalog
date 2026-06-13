SELECT
  x_10 AS col0,
  ABS(((x_10) - (5))) AS col1
FROM
  UNNEST(SEQUENCE(0, 10 - 1)) as pushkin(x_10)
WHERE
  (x_10 > 0) ORDER BY col0;