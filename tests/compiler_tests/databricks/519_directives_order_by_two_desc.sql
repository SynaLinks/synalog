WITH t_0_V AS (SELECT * FROM VALUES
  (1, 9),
  (2, 1),
  (2, 2)
AS UNUSED_TABLE_NAME(a, b))
SELECT
  V.a AS a,
  V.b AS b
FROM
  t_0_V AS V ORDER BY a desc, b desc;