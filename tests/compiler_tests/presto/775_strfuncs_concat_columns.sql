WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'a' AS s,
      1 AS n
   UNION ALL
  
    SELECT
      'b' AS s,
      2 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (CONCAT((CONCAT(V.s, '-')), CAST(V.n AS VARCHAR))) AS t
FROM
  t_0_V AS V ORDER BY t;