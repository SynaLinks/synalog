SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY["-- comment", "other"]) as x_1
WHERE
  (x_1 != "other");