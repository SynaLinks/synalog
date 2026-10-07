WITH t_0_T AS (SELECT * FROM VALUES
  ("d", 4),
  ("a", 1),
  ("c", 3),
  ("b", 2)
AS UNUSED_TABLE_NAME(k, v))
SELECT
  T.k AS k,
  T.v AS v
FROM
  t_0_T AS T ORDER BY k NULLS LAST;