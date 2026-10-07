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
  t_0_X.k AS k
FROM
  t_1_X AS t_0_X
WHERE
  (t_0_X.x > -5) ORDER BY k NULLS LAST;