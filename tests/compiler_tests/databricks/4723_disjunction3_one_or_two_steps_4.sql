WITH t_2_P AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (4, 4),
  (5, 1),
  (7, 6)
AS UNUSED_TABLE_NAME(a, b)),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_1_P.b AS x
    FROM
      t_2_P AS t_1_P
    WHERE
      (t_1_P.a = 4)
   UNION ALL
  
    SELECT
      t_4_P.b AS x
    FROM
      t_2_P AS t_3_P, t_2_P AS t_4_P
    WHERE
      (t_3_P.a = 4) AND
      (t_4_P.a = t_3_P.b)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.x AS x
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1 ORDER BY x NULLS LAST;