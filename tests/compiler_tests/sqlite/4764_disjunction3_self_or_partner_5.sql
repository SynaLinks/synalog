WITH t_2_P AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      5 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      7 AS a,
      6 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      t_1_P.b AS x
    FROM
      t_2_P AS t_1_P
    WHERE
      (t_1_P.a = 5)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.x AS x
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY Q_MultBodyAggAux.x ORDER BY x NULLS LAST;