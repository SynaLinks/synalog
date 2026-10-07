WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS b
   UNION ALL
  
    SELECT
      2 AS k,
      true AS b
   UNION ALL
  
    SELECT
      3 AS k,
      false AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k
FROM
  t_0_V AS V
WHERE
  V.b;