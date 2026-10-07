WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_1_V.k AS k,
  ((t_1_V.k) * (2)) AS v
FROM
  t_2_V AS t_1_V ORDER BY k NULLS LAST;