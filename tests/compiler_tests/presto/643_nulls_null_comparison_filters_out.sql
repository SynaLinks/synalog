WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS x
   UNION ALL
  
    SELECT
      2 AS k,
      5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k
FROM
  t_0_V AS V
WHERE
  (V.x > 1);