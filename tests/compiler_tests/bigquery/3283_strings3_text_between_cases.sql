WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      "Z" AS w
   UNION ALL
  
    SELECT
      "a" AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.w AS w
FROM
  t_0_V AS V
WHERE
  (V.w < "a");