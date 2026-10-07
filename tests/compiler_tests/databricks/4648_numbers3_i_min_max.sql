WITH t_1_X AS (SELECT * FROM VALUES
  (1, 17),
  (2, -17),
  (3, 4),
  (4, 0),
  (5, null),
  (6, 3000000000),
  (7, -1),
  (8, 9)
AS UNUSED_TABLE_NAME(k, x))
SELECT
  MIN(t_0_X.x) AS lo,
  MAX(t_0_X.x) AS hi
FROM
  t_1_X AS t_0_X;