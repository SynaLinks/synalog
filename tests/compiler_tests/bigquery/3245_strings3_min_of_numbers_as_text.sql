WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      "9" AS w
   UNION ALL
  
    SELECT
      "10" AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MIN(V.w) AS lo,
  MAX(V.w) AS hi
FROM
  t_0_V AS V;