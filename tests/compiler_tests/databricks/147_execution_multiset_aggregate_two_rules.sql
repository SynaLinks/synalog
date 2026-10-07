WITH t_0_Total_MultBodyAggAux AS (SELECT * FROM VALUES
  ("a", 2),
  ("a", 3)
AS UNUSED_TABLE_NAME(k, t))
SELECT
  Total_MultBodyAggAux.k AS k,
  SUM(Total_MultBodyAggAux.t) AS t
FROM
  t_0_Total_MultBodyAggAux AS Total_MultBodyAggAux
GROUP BY 1;