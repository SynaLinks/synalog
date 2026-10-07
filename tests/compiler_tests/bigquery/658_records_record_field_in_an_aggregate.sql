WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      STRUCT(2 AS a) AS r
   UNION ALL
  
    SELECT
      STRUCT(3 AS a) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(V.r.a) AS t
FROM
  t_0_V AS V;