WITH t_0_A AS (SELECT * FROM VALUES
  (1, 1),
  (null, 2)
AS UNUSED_TABLE_NAME(k, v)),
t_1_B AS (SELECT * FROM VALUES
  (1),
  (null)
AS UNUSED_TABLE_NAME(k))
SELECT
  A.v AS v
FROM
  t_0_A AS A, t_1_B AS B
WHERE
  (B.k = A.k);