WITH t_1_V AS (SELECT * FROM VALUES
  (1, null),
  (2, null)
AS UNUSED_TABLE_NAME(k, v))
SELECT
  SUM(1) AS n
FROM
  t_1_V AS t_0_V
WHERE
  (t_0_V.v IS null);