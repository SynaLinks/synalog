SELECT
  SUBSTR(x_2, 1, 2) AS p
FROM
  UNNEST(ARRAY["apple", "pear"]) as x_2 ORDER BY p;