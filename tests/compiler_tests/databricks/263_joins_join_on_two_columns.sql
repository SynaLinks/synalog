WITH t_2_A AS (SELECT * FROM VALUES
  (1, 1),
  (1, 2)
AS UNUSED_TABLE_NAME(a, b))
SELECT
  t_0_A.a AS a,
  t_0_A.b AS b,
  "x" AS v
FROM
  t_2_A AS t_0_A
WHERE
  (t_0_A.a = 1) AND
  (t_0_A.b = 1);