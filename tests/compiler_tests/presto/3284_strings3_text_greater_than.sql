WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'A' AS w
   UNION ALL
  
    SELECT
      'Z' AS w
   UNION ALL
  
    SELECT
      'n' AS w
   UNION ALL
  
    SELECT
      'z' AS w
   UNION ALL
  
    SELECT
      'm' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.w AS w
FROM
  t_0_V AS V
WHERE
  (V.w > 'm') ORDER BY w;