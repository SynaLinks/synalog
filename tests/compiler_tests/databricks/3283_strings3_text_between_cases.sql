WITH t_0_V AS (SELECT * FROM VALUES
  ("Z"),
  ("a")
AS UNUSED_TABLE_NAME(w))
SELECT
  V.w AS w
FROM
  t_0_V AS V
WHERE
  (V.w < "a");