WITH t_2_A AS (SELECT * FROM VALUES
  (null, 1),
  (5, 2),
  (null, 3)
AS UNUSED_TABLE_NAME(k, a)),
t_3_B AS (SELECT * FROM VALUES
  (null, 10),
  (5, 20)
AS UNUSED_TABLE_NAME(k, b))
SELECT
  t_0_A.a AS a,
  t_1_B.b AS b
FROM
  t_2_A AS t_0_A, t_3_B AS t_1_B
WHERE
  (t_1_B.k = t_0_A.k);