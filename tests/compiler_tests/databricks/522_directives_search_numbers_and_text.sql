WITH t_0_V AS (SELECT * FROM VALUES
  (7, "x"),
  (8, "a7"),
  (9, "b")
AS UNUSED_TABLE_NAME(n, t))
SELECT
  V.n AS n,
  V.t AS t
FROM
  t_0_V AS V ORDER BY n NULLS LAST;