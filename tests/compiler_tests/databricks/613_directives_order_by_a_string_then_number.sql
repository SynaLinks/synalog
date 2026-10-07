WITH t_0_V AS (SELECT * FROM VALUES
  ("b", 3),
  ("a", 1),
  ("a", 2)
AS UNUSED_TABLE_NAME(s, n))
SELECT
  V.s AS s,
  V.n AS n
FROM
  t_0_V AS V ORDER BY s NULLS LAST, n desc;