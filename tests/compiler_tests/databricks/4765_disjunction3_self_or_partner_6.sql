WITH t_2_P AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (4, 4),
  (5, 1),
  (7, 6)
AS UNUSED_TABLE_NAME(a, b)),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      6 AS x
   UNION ALL
  
    SELECT
      t_1_P.b AS x
    FROM
      t_2_P AS t_1_P
    WHERE
      (t_1_P.a = 6)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.x AS x
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1 ORDER BY x NULLS LAST;