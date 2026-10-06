WITH t_1_V AS (SELECT * FROM VALUES
  (1, null),
  (2, 4),
  (3, 7)
AS UNUSED_TABLE_NAME(k, v))
SELECT
  t_0_V.k AS k,
  t_0_V.v AS r
FROM
  t_1_V AS t_0_V ORDER BY k NULLS LAST;