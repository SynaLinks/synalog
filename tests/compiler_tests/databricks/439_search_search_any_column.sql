WITH t_0_V AS (SELECT * FROM VALUES
  (1, "xa", "q"),
  (2, "b", "xy"),
  (3, "c", "d")
AS UNUSED_TABLE_NAME(n, s, t))
SELECT
  V.n AS n,
  V.s AS s,
  V.t AS t
FROM
  t_0_V AS V ORDER BY n NULLS LAST;