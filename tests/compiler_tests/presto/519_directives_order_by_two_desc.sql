WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      9 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      2 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.a AS a,
  V.b AS b
FROM
  t_0_V AS V ORDER BY a desc, b desc;