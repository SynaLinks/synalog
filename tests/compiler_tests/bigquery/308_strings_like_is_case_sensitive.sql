SELECT
  x_3 AS w
FROM
  UNNEST(ARRAY["abc", "ABC"]) as x_3
WHERE
  (x_3 LIKE "abc") ORDER BY w;