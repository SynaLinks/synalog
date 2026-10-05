WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1.5E0 AS x,
      42 AS y,
      null AS z
   UNION ALL
  
    SELECT
      2.5E0 AS x,
      7 AS y,
      1 AS z
  
) AS UNUSED_TABLE_NAME  )
SELECT
  CAST(V.x AS STRING) AS a,
  CAST(V.y AS STRING) AS b,
  CAST(V.z AS STRING) AS c
FROM
  t_0_V AS V
WHERE
  (V.x < 2);