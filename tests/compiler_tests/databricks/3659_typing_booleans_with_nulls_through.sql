WITH t_0_V AS (SELECT * FROM VALUES
  (1, null),
  (2, true),
  (3, false)
AS UNUSED_TABLE_NAME(k, b))
SELECT
  V.k AS k
FROM
  t_0_V AS V
WHERE
  V.b;