SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY["x' OR '1'='1", "other"]) as x_1
WHERE
  (x_1 != "other");