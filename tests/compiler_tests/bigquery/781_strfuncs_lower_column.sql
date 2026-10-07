SELECT
  x_3 AS w,
  LOWER(x_3) AS u
FROM
  UNNEST(ARRAY["Apple", "kiwi", "Banana"]) as x_3 ORDER BY w;