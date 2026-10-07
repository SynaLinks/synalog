WITH t_2_B AS (SELECT * FROM (
  
    SELECT
      2 AS k
   UNION ALL
  
    SELECT
      5 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  1 AS a,
  t_1_B.k AS b
FROM
  t_2_B AS t_1_B
WHERE
  (t_1_B.k = ((1) + (1)));