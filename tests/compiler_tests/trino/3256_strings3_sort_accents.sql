WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'é' AS w
   UNION ALL
  
    SELECT
      'z' AS w
   UNION ALL
  
    SELECT
      'e' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.w AS w
FROM
  t_0_V AS V ORDER BY w;