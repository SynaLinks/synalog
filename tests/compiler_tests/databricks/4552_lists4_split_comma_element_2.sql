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
  (CASE WHEN 2 < 0 THEN NULL ELSE ELEMENT_AT(SPLIT(T.s, REGEXP_REPLACE(",", '([^a-zA-Z0-9])', '\\\\$1')), CAST(2 AS INT) + 1) END) AS v
FROM
  t_0_T AS T ORDER BY k NULLS LAST;