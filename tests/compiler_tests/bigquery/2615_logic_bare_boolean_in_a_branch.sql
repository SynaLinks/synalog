WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      true AS b,
      "ab" AS s
   UNION ALL
  
    SELECT
      2 AS x,
      false AS b,
      "ba" AS s
   UNION ALL
  
    SELECT
      3 AS x,
      null AS b,
      null AS s
  
) AS UNUSED_TABLE_NAME  ),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      V.x AS x
    FROM
      t_1_V AS V
    WHERE
      V.b
   UNION ALL
  
    SELECT
      t_2_V.x AS x
    FROM
      t_1_V AS t_2_V
    WHERE
      (t_2_V.x = 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.x AS x
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY x ORDER BY x NULLS LAST;