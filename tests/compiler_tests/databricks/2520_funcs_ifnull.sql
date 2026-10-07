WITH t_0_V AS (SELECT * FROM VALUES
  (1, "n"),
  (2, null)
AS UNUSED_TABLE_NAME(id, z))
SELECT
  V.id AS id,
  COALESCE(V.z, "?") AS z
FROM
  t_0_V AS V ORDER BY id NULLS LAST;