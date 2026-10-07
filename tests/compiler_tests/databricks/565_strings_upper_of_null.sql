WITH t_0_V AS (SELECT * FROM VALUES
  (1, null),
  (2, "ab")
AS UNUSED_TABLE_NAME(k, s))
SELECT
  V.k AS k,
  UPPER(V.s) AS a,
  LENGTH(V.s) AS b,
  SUBSTR(V.s, 1, 1) AS c
FROM
  t_0_V AS V ORDER BY k NULLS LAST;