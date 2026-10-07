SELECT
  x_3 AS w
FROM
  UNNEST(ARRAY["abc", "axyzc", "abd"]) as x_3
WHERE
  (x_3 LIKE "a%c") ORDER BY w;