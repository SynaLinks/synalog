WITH t_0_V AS (SELECT * FROM VALUES
  (1, 2),
  (1, 1)
AS UNUSED_TABLE_NAME(a, b))
SELECT
  AVG(((V.a) / (V.b))) AS r
FROM
  t_0_V AS V;