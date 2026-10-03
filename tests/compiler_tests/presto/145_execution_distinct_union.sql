WITH t_0_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_3 AS x
    FROM
      UNNEST(ARRAY[1, 2]) as pushkin(x_3)
   UNION ALL
  
    SELECT
      x_5 AS x
    FROM
      UNNEST(ARRAY[2, 3]) as pushkin(x_5)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U_MultBodyAggAux.x AS x
FROM
  t_0_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1 ORDER BY x;