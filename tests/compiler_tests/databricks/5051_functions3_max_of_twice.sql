WITH t_1_V AS (SELECT * FROM VALUES
  (1, 3, "ab"),
  (2, -4, "hello"),
  (3, 0, ""),
  (4, null, "x"),
  (5, 12, null),
  (6, 7, "seven")
AS UNUSED_TABLE_NAME(k, x, s))
SELECT
  MAX(((((((((V.x) + (1))) + (1))) - (2))) + (V.x))) AS m
FROM
  t_1_V AS V;