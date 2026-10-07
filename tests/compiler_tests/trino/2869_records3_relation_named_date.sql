WITH t_0_Date AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Date.x AS x
FROM
  t_0_Date AS Date ORDER BY x;