WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS `trim`
   UNION ALL
  
    SELECT
      2 AS `trim`
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.`trim` AS `trim`
FROM
  t_0_V AS V ORDER BY `trim` NULLS LAST;