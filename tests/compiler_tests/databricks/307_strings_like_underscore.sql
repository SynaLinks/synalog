SELECT
  x_3 AS w
FROM
  explode(ARRAY("abc", "abbc", "ac")) AS pushkin(x_3)
WHERE
  (CAST(x_3 AS STRING) LIKE "a_c") ORDER BY w;