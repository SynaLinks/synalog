WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      10 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      12 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.a AS a,
  V.b AS b,
  (((V.a) - (V.b) * CAST((V.a) / NULLIF(V.b, 0) AS INTEGER))) AS r
FROM
  t_0_V AS V ORDER BY a NULLS LAST;