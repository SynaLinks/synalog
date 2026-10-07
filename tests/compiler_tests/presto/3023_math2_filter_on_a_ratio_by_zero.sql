WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      7 AS x,
      0 AS z
   UNION ALL
  
    SELECT
      2 AS id,
      0 AS x,
      0 AS z
   UNION ALL
  
    SELECT
      3 AS id,
      7.5E0 AS x,
      2 AS z
   UNION ALL
  
    SELECT
      4 AS id,
      -7.5E0 AS x,
      2 AS z
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.id AS id
FROM
  t_0_V AS V
WHERE
  ((CAST(V.x AS DOUBLE) / NULLIF(V.z, 0)) > 1);