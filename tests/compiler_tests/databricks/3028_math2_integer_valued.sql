WITH t_0_V AS (SELECT * FROM VALUES
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
AS UNUSED_TABLE_NAME(id, x))
SELECT
  V.id AS id
FROM
  t_0_V AS V
WHERE
  (FLOOR(V.x) = V.x) ORDER BY id NULLS LAST;