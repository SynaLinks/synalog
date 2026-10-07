WITH t_0_U AS (SELECT * FROM VALUES
  (1, 10),
  (2, ((2) * (10))),
  (3, 30)
AS UNUSED_TABLE_NAME(k, v))
SELECT
  U.k AS k,
  U.v AS v
FROM
  t_0_U AS U ORDER BY k NULLS LAST;