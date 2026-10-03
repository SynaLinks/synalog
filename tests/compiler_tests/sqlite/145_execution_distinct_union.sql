WITH t_0_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_3.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 2)) as x_3
   UNION ALL
  
    SELECT
      x_5.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(2, 3)) as x_5
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U_MultBodyAggAux.x AS x
FROM
  t_0_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY U_MultBodyAggAux.x ORDER BY x;