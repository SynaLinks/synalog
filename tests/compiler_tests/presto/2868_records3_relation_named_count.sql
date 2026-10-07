WITH t_0_Count AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Count.x AS x
FROM
  t_0_Count AS Count ORDER BY x;