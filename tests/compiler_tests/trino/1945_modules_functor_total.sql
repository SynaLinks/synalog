WITH t_0_Mine AS (SELECT * FROM (
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      9 AS x
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(Mine.x) AS t
FROM
  t_0_Mine AS Mine;
