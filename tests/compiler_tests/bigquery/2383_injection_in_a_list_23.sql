SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY["0x27 OR 1", "other"]) as x_1
WHERE
  (x_1 != "other");