SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY["`; DROP TABLE t; `", "other"]) as x_1
WHERE
  (x_1 != "other");