SELECT
  x_3 AS s
FROM
  UNNEST(ARRAY["a", "b", "c"]) as x_3
WHERE
  (x_3 > "a") AND
  (x_3 < "c");