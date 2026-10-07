WITH t_1_V AS (SELECT * FROM VALUES
  (1, 2.5E0),
  (2, null),
  (3, 0.25E0)
AS UNUSED_TABLE_NAME(k, v))
SELECT
  t_0_V.k AS k,
  t_0_V.v AS r
FROM
  t_1_V AS t_0_V ORDER BY k NULLS LAST;