SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY["{x}; DROP", "other"]) as x_1
WHERE
  (x_1 != "other");