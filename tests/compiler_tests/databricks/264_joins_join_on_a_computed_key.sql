WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      2 AS k
   UNION ALL
  
    SELECT
      5 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  1 AS a,
  B.k AS b
FROM
  t_0_B AS B
WHERE
  (B.k = ((1) + (1)));