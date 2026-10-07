WITH t_0_V AS (SELECT * FROM VALUES
  (1, 7, 0),
  (2, 0, 0),
  (3, 7.5E0, 2),
  (4, -7.5E0, 2)
AS UNUSED_TABLE_NAME(id, x, z))
SELECT
  V.id AS id
FROM
  t_0_V AS V
WHERE
  (((V.x) / NULLIF(V.z, 0)) > 1);