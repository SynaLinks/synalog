SELECT
  x_3 AS s
FROM
  UNNEST(ARRAY["a", "A", "a"]) as x_3
GROUP BY s ORDER BY s;