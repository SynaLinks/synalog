WITH t_1_Banned AS (SELECT * FROM (
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_Out_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_5 AS x
    FROM
      UNNEST(ARRAY[1, 2, 3]) as pushkin(x_5)
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        t_1_Banned AS Banned
      WHERE
        (Banned.x = x_5)) IS NULL)
   UNION ALL
  
    SELECT
      3 AS x
    FROM
      UNNEST(ARRAY[1, 2, 3]) as pushkin(x_11)
    WHERE
      (x_11 = 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Out_MultBodyAggAux.x AS x
FROM
  t_0_Out_MultBodyAggAux AS Out_MultBodyAggAux
GROUP BY 1 ORDER BY x;