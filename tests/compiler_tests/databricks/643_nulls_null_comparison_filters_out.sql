WITH t_0_V AS (SELECT * FROM VALUES
  (1, null),
  (2, 5)
AS UNUSED_TABLE_NAME(k, x))
SELECT
  V.k AS k
FROM
  t_0_V AS V
WHERE
  (V.x > 1);