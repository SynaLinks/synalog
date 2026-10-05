WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      null AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x
FROM
  t_0_V AS V ORDER BY x nulls first;