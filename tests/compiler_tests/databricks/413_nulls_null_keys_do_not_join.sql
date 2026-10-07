WITH t_2_A AS (SELECT * FROM VALUES
  (null, 0),
  (1, 1)
AS UNUSED_TABLE_NAME(k, a)),
t_3_B AS (SELECT * FROM VALUES
  (null, 0),
  (1, 1)
AS UNUSED_TABLE_NAME(k, b))
SELECT
  t_0_A.a AS a
FROM
  t_2_A AS t_0_A, t_3_B AS t_1_B
WHERE
  (t_1_B.k = t_0_A.k);