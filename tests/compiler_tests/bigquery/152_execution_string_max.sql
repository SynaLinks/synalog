SELECT
  MAX(x_2) AS n
FROM
  UNNEST(ARRAY["apple", "pear", "fig"]) as x_2;