WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      "1" AS k
   UNION ALL
  
    SELECT
      "01" AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  "x" AS t
FROM
  t_0_B AS B
WHERE
  (B.k = "1")
GROUP BY t;