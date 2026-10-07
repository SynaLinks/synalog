WITH t_0_V AS (SELECT * FROM VALUES
  ("a"),
  (null),
  ("b")
AS UNUSED_TABLE_NAME(s))
SELECT
  V.s AS s
FROM
  t_0_V AS V ORDER BY s desc;