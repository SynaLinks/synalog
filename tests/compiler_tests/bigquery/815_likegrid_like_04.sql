SELECT
  x_3 AS w
FROM
  UNNEST(ARRAY["cat", "cart", "scat", "Cat", "ct", "c_t"]) as x_3
WHERE
  (x_3 LIKE "%a%") ORDER BY w;