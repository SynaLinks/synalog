WITH t_0_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_5.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 2, 3, 4)) as x_5
    WHERE
      (x_5.value < 2)
   UNION ALL
  
    SELECT
      x_9.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 2, 3, 4)) as x_9
    WHERE
      (x_9.value > 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U_MultBodyAggAux.x AS x
FROM
  t_0_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY U_MultBodyAggAux.x ORDER BY x;