WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS x
   UNION ALL
  
    SELECT
      2 AS k,
      4 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k,
  (((V.x) / (2)) IS NULL) AS n
FROM
  t_0_V AS V ORDER BY k;