WITH t_0_V AS (SELECT * FROM VALUES
  (1, true, "ab"),
  (2, false, "ba"),
  (3, null, null)
AS UNUSED_TABLE_NAME(x, b, s))
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  V.b AND
  (V.x > 1);