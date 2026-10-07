WITH t_0_V AS (SELECT * FROM VALUES
  (2, 3),
  (1, 5)
AS UNUSED_TABLE_NAME(p, q))
SELECT
  SUM(((V.p) * (V.q))) AS t
FROM
  t_0_V AS V;