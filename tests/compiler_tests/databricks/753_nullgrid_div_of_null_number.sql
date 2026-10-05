WITH t_0_V AS (SELECT * FROM VALUES
  (1, null),
  (2, 4)
AS UNUSED_TABLE_NAME(k, x))
SELECT
  V.k AS k,
  (((V.x) / (2)) IS NULL) AS n
FROM
  t_0_V AS V ORDER BY k NULLS LAST;