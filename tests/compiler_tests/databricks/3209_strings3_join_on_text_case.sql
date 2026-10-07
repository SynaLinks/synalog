WITH t_2_B AS (SELECT * FROM VALUES
  ("x", 10),
  ("X", 20)
AS UNUSED_TABLE_NAME(k, b))
SELECT
  1 AS a,
  t_1_B.b AS b
FROM
  t_2_B AS t_1_B
WHERE
  (t_1_B.k = "x");