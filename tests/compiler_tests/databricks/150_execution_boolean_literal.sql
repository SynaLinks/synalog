WITH t_0_F AS (SELECT * FROM VALUES
  (1, true),
  (2, false)
AS UNUSED_TABLE_NAME(x, ok))
SELECT
  F.x AS x
FROM
  t_0_F AS F
WHERE
  (F.ok = true);