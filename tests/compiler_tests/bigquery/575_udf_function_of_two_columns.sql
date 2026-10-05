WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.a AS a,
  V.b AS b,
  ((((V.a) * (V.a))) + (((V.b) * (V.b)))) AS s
FROM
  t_0_V AS V ORDER BY a;