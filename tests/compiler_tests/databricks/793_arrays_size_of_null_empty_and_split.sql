WITH t_0_V AS (SELECT * FROM VALUES
  (1, ""),
  (2, "a,b"),
  (3, null)
AS UNUSED_TABLE_NAME(k, s))
SELECT
  V.k AS k,
  ARRAY_SIZE(SPLIT(V.s, ",")) AS n
FROM
  t_0_V AS V ORDER BY k NULLS LAST;