WITH t_0_T AS (SELECT * FROM VALUES
  (1, "a,b,c"),
  (2, ""),
  (3, "abc"),
  (4, ",,"),
  (5, "x,"),
  (6, null)
AS UNUSED_TABLE_NAME(k, s))
SELECT
  T.k AS k,
  ARRAY_SIZE(SPLIT(T.s, REGEXP_REPLACE("b", '([^a-zA-Z0-9])', '\\\\$1'))) AS n
FROM
  t_0_T AS T ORDER BY k NULLS LAST;