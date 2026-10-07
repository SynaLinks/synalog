SELECT
  "a" AS s
FROM
  UNNEST(ARRAY["a", "A"]) as x_3
WHERE
  (x_3 = "a");