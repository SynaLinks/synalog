SELECT
  x_3 AS w,
  LENGTH(x_3) AS n
FROM
  UNNEST(ARRAY["Apple", "kiwi", "Banana"]) as x_3 ORDER BY w;