SELECT
  x_3 AS w
FROM
  UNNEST(ARRAY["apple", "banana", "apricot"]) as x_3
WHERE
  (x_3 LIKE "ap%") ORDER BY w;