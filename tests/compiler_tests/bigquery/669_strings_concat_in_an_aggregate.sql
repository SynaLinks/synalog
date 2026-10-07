SELECT
  x_3 AS s,
  MAX((x_3 || "!")) AS t
FROM
  UNNEST(ARRAY["b", "a"]) as x_3
GROUP BY s ORDER BY s;