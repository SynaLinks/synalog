WITH t_0_V AS (SELECT * FROM VALUES
  (1, 5),
  (2, null)
AS UNUSED_TABLE_NAME(k, x))
SELECT
  V.k AS k,
  CASE WHEN (V.x IS null) THEN "unset" ELSE "set" END AS w
FROM
  t_0_V AS V ORDER BY k NULLS LAST;