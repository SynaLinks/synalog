SELECT
  x_3 AS w
FROM
  UNNEST(ARRAY["apple", "pear"]) as x_3
WHERE
  (x_3 < "banana");