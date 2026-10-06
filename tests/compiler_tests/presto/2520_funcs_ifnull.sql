WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'n' AS z
   UNION ALL
  
    SELECT
      2 AS id,
      null AS z
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.id AS id,
  COALESCE(V.z, '?') AS z
FROM
  t_0_V AS V ORDER BY id;