WITH t_1_V AS (SELECT * FROM VALUES
  (1, null),
  (2, 7),
  (3, null)
AS UNUSED_TABLE_NAME(k, v))
SELECT
  SUM(CASE WHEN (t_0_V.v IS null) THEN 1 ELSE 0 END) AS n
FROM
  t_1_V AS t_0_V;