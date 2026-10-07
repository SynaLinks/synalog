WITH t_1_E AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3)
AS UNUSED_TABLE_NAME(a, b)),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS x
    FROM
      t_1_E AS E
   UNION ALL
  
    SELECT
      t_2_E.b AS x
    FROM
      t_1_E AS t_2_E
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.x AS x
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1 ORDER BY x NULLS LAST;