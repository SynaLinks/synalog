SELECT
  SUM(1) AS n
FROM
  UNNEST(ARRAY["Apple", "kiwi", "Banana"]) as x_2
WHERE
  (UPPER(LOWER(x_2)) = UPPER(x_2));