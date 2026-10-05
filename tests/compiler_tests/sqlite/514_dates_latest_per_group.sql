WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      '2024-01-01' AS d
   UNION ALL
  
    SELECT
      'a' AS g,
      '2024-05-01' AS d
   UNION ALL
  
    SELECT
      'b' AS g,
      '2023-01-01' AS d
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  MAX(V.d) AS d
FROM
  t_0_V AS V
GROUP BY V.g ORDER BY g;