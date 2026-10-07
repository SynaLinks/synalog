WITH t_2_B AS (SELECT * FROM VALUES
  (2),
  (5)
AS UNUSED_TABLE_NAME(k))
SELECT
  1 AS a,
  t_1_B.k AS b
FROM
  t_2_B AS t_1_B
WHERE
  (t_1_B.k = ((1) + (1)));