WITH t_2_N AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      'x' AS s
   UNION ALL
  
    SELECT
      2 AS n,
      'y' AS s
   UNION ALL
  
    SELECT
      3 AS n,
      'z' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_1_N.n AS n
    FROM
      t_2_N AS t_1_N
    WHERE
      (t_1_N.n = 1)
   UNION ALL
  
    SELECT
      t_3_N.n AS n
    FROM
      t_2_N AS t_3_N
    WHERE
      (t_3_N.n = 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.n AS n
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1 ORDER BY n;