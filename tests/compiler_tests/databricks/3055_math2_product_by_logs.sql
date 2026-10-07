WITH t_3_V AS (SELECT * FROM VALUES
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
t_1_S AS (SELECT
  SUM(LOG(t_2_V.x)) AS s
FROM
  t_3_V AS t_2_V
WHERE
  (t_2_V.x > 0))
SELECT
  EXP(t_0_S.s) AS v
FROM
  t_1_S AS t_0_S;