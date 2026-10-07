WITH t_2_V AS (SELECT * FROM VALUES
  (1, 7),
  (2, -7),
  (3, 2.5E0),
  (4, -2.5E0),
  (5, 0),
  (6, 3),
  (7, 0.125E0),
  (8, 1000000),
  (9, -0.75E0),
  (10, 12.345E0)
AS UNUSED_TABLE_NAME(id, x)),
t_1_M AS (SELECT
  AVG(V.x) AS m,
  AVG(((V.x) * (V.x))) AS m2
FROM
  t_2_V AS V)
SELECT
  t_0_M.m AS mean,
  ((t_0_M.m2) - ((POW(t_0_M.m, 2)))) AS var
FROM
  t_1_M AS t_0_M;