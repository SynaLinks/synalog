WITH t_0_D_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  D_MultBodyAggAux.x AS x
FROM
  t_0_D_MultBodyAggAux AS D_MultBodyAggAux
GROUP BY D_MultBodyAggAux.x;