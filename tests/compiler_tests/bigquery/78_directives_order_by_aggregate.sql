WITH t_0_Sale AS (SELECT * FROM (
  
    SELECT
      "a" AS k,
      1 AS v
   UNION ALL
  
    SELECT
      "a" AS k,
      2 AS v
   UNION ALL
  
    SELECT
      "b" AS k,
      10 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Sale.k AS k,
  SUM(Sale.v) AS v
FROM
  t_0_Sale AS Sale
GROUP BY k ORDER BY v DESC;