WITH t_1_V AS (SELECT * FROM VALUES
  (null),
  (7),
  (3)
AS UNUSED_TABLE_NAME(v))
SELECT
  MAX(t_0_V.v) AS m
FROM
  t_1_V AS t_0_V;