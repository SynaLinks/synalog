SELECT
  x_3 AS t,
  ARRAY_LENGTH(SPLIT(x_3, ",")) AS n
FROM
  UNNEST(ARRAY["a,b", "c"]) as x_3 ORDER BY t;