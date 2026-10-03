WITH t_0_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_3 AS x
    FROM
      explode(ARRAY(1, 2)) AS pushkin(x_3)
   UNION ALL
  
    SELECT
      x_5 AS x
    FROM
      explode(ARRAY(2, 3)) AS pushkin(x_5)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U_MultBodyAggAux.x AS x
FROM
  t_0_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1 ORDER BY x;