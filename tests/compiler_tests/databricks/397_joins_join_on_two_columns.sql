WITH t_0_A AS (SELECT * FROM VALUES
  (1, 1, "x"),
  (1, 2, "y")
AS UNUSED_TABLE_NAME(k1, k2, v))
SELECT
  A.v AS v
FROM
  t_0_A AS A
WHERE
  (A.k1 = 1) AND
  (A.k2 = 1);