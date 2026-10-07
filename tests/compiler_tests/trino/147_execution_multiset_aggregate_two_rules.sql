WITH t_0_Total_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      2 AS t
   UNION ALL
  
    SELECT
      'a' AS k,
      3 AS t
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Total_MultBodyAggAux.k AS k,
  SUM(Total_MultBodyAggAux.t) AS t
FROM
  t_0_Total_MultBodyAggAux AS Total_MultBodyAggAux
GROUP BY 1;