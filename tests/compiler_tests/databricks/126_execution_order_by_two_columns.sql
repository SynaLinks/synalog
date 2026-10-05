WITH t_0_R AS (SELECT * FROM VALUES
  ("b", 3),
  ("a", 1),
  ("a", 2)
AS UNUSED_TABLE_NAME(k, v))
SELECT
  R.k AS k,
  R.v AS v
FROM
  t_0_R AS R ORDER BY k NULLS LAST, v DESC;