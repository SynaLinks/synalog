WITH t_0_V AS (SELECT * FROM VALUES
  (1),
  (null),
  (3)
AS UNUSED_TABLE_NAME(x))
SELECT
  V.x AS x
FROM
  t_0_V AS V ORDER BY x nulls first;