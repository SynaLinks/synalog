SELECT
  x_3 AS w
FROM
  explode(ARRAY("abc", "ABC")) AS pushkin(x_3)
WHERE
  (CAST(x_3 AS STRING) LIKE "abc") ORDER BY w;