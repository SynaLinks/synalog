WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS "cube"
   UNION ALL
  
    SELECT
      2 AS "cube"
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V."cube" AS "cube"
FROM
  t_0_V AS V ORDER BY "cube" NULLS LAST;