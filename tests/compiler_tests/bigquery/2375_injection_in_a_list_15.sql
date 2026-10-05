SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY["');ATTACH DATABASE 'x' AS y;--", "other"]) as x_1
WHERE
  (x_1 != "other");