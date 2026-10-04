SELECT
  MIN(x_2) AS m
FROM
  UNNEST(ARRAY["pear", "apple", "fig"]) as x_2;