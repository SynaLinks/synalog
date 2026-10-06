WITH t_1_V AS (SELECT * FROM VALUES
  (1, true, "ab"),
  (2, false, "ba"),
  (3, null, null)
AS UNUSED_TABLE_NAME(x, b, s)),
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
GROUP BY 1 ORDER BY x NULLS LAST;