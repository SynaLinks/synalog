WITH t_1_M AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  M.k AS k,
  SUM(1) AS n
FROM
  t_1_M AS M, UNNEST(ARRAY[1, 2]) as x_4
WHERE
  (x_4 = M.k)
GROUP BY k ORDER BY k NULLS LAST;