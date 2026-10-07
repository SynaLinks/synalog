WITH t_0_A AS (SELECT * FROM VALUES
  (1, 2, 1),
  (1, 3, 2)
AS UNUSED_TABLE_NAME(x, y, id)),
t_1_B AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(x, y))
SELECT
  A.id AS id
FROM
  t_0_A AS A, t_1_B AS B
WHERE
  (B.x = A.x) AND
  (B.y = A.y);