WITH t_1_I AS (SELECT * FROM VALUES
  (1, "red", 10, null),
  (2, "blue", 25, "x"),
  (3, "red", 40, "y"),
  (4, "green", 5, null),
  (5, "blue", 60, "x"),
  (6, null, 30, "z"),
  (7, "green", 45, "y")
AS UNUSED_TABLE_NAME(id, c, p, t)),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      1 AS n
    FROM
      t_1_I AS I
    WHERE
      (I.p > 45)
   UNION ALL
  
    SELECT
      1 AS n
    FROM
      t_1_I AS t_2_I
    WHERE
      (t_2_I.p < 9)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(Q_MultBodyAggAux.n) AS n
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux;