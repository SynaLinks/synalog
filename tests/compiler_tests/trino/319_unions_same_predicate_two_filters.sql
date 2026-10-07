WITH t_0_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_5 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[1, 2, 3, 4], synalog_e -> ROW(synalog_e))) as pushkin(x_5)
    WHERE
      (x_5 < 2)
   UNION ALL
  
    SELECT
      x_9 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[1, 2, 3, 4], synalog_e -> ROW(synalog_e))) as pushkin(x_9)
    WHERE
      (x_9 > 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U_MultBodyAggAux.x AS x
FROM
  t_0_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1 ORDER BY x;