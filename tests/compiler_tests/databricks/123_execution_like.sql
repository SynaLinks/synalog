SELECT
  x_3 AS w
FROM
  explode(ARRAY("apple", "banana", "apricot")) AS pushkin(x_3)
WHERE
  (CAST(x_3 AS STRING) LIKE "ap%") ORDER BY w;