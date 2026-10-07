WITH t_2_N AS (SELECT * FROM VALUES
  (1, "x"),
  (2, "y"),
  (3, "z")
AS UNUSED_TABLE_NAME(n, s)),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_1_N.n AS n
    FROM
      t_2_N AS t_1_N
    WHERE
      (t_1_N.n > 2)
   UNION ALL
  
    SELECT
      t_3_N.n AS n
    FROM
      t_2_N AS t_3_N
    WHERE
      (t_3_N.n < 2)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.n AS n
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1;