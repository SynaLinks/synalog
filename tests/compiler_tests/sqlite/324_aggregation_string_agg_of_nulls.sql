WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'g' AS g,
      null AS s
   UNION ALL
  
    SELECT
      'h' AS g,
      null AS s
   UNION ALL
  
    SELECT
      'h' AS g,
      'x' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  GROUP_CONCAT(V.s) AS s
FROM
  t_0_V AS V
GROUP BY V.g ORDER BY g;