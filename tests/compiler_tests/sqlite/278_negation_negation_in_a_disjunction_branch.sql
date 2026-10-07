WITH t_1_Banned AS (SELECT * FROM (
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_Out_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_5.value AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_5
    WHERE
      ((SELECT
        MIN(MagicalEntangle(1, x_8.value)) AS logica_value
      FROM
        t_1_Banned AS Banned, JSON_EACH(JSON_ARRAY(0)) as x_8
      WHERE
        (Banned.x = x_5.value)) IS NULL)
   UNION ALL
  
    SELECT
      3 AS x
    FROM
      JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_12
    WHERE
      (x_12.value = 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Out_MultBodyAggAux.x AS x
FROM
  t_0_Out_MultBodyAggAux AS Out_MultBodyAggAux
GROUP BY Out_MultBodyAggAux.x ORDER BY x;