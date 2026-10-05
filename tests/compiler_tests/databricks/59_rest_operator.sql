WITH t_1_Record AS (SELECT * FROM VALUES
  (1, 2, 3),
  (4, 5, 6)
AS UNUSED_TABLE_NAME(a, b, c)),
t_0_CopyAll AS (SELECT
  Record.*
FROM
  t_1_Record AS Record ORDER BY a NULLS LAST)
SELECT
  CopyAll.a AS a,
  CopyAll.b AS b,
  CopyAll.c AS c
FROM
  t_0_CopyAll AS CopyAll ORDER BY a NULLS LAST;