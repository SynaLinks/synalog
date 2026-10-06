WITH t_1_V AS (SELECT * FROM VALUES
  (1, 7, 0),
  (2, 0, 0),
  (3, 7.5E0, 2),
  (4, -7.5E0, 2)
AS UNUSED_TABLE_NAME(id, x, z))
SELECT
  t_0_V.id AS id,
  ((t_0_V.x) / NULLIF(t_0_V.z, 0)) AS v
FROM
  t_1_V AS t_0_V ORDER BY id NULLS LAST;