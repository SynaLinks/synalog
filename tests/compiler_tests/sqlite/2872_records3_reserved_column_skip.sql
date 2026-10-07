WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS "skip"
   UNION ALL
  
    SELECT
      2 AS "skip"
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V."skip" AS "skip"
FROM
  t_0_V AS V ORDER BY "skip" NULLS LAST;