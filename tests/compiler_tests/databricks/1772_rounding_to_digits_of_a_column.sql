WITH t_1_V AS (SELECT * FROM VALUES
  ("a", 1),
  ("b", 2)
AS UNUSED_TABLE_NAME(k, x)),
t_2_T AS (SELECT
  SUM(t_3_V.x) AS t
FROM
  t_1_V AS t_3_V)
SELECT
  V.k AS k,
  ROUND(((100) * (((V.x) / (t_0_T.t)))), 2) AS pct
FROM
  t_1_V AS V, t_2_T AS t_0_T ORDER BY k NULLS LAST;
