WITH t_0_V AS (SELECT * FROM VALUES
  (1, 2),
  (3, 4)
AS UNUSED_TABLE_NAME(a, b))
SELECT
  V.a AS a,
  V.b AS b,
  ((((V.a) * (V.a))) + (((V.b) * (V.b)))) AS s
FROM
  t_0_V AS V ORDER BY a NULLS LAST;