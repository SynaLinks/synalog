SELECT
  SUM(1) AS n
FROM
  UNNEST(ARRAY[1, 2]) as x_3, UNNEST(ARRAY["a", "b", "c"]) as x_5;