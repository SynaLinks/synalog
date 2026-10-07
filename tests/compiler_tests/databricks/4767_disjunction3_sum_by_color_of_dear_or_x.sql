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
      I.c AS c,
      I.p AS s
    FROM
      t_1_I AS I
    WHERE
      (I.c IS NOT null) AND
      (I.p > 30)
   UNION ALL
  
    SELECT
      t_2_I.c AS c,
      t_2_I.p AS s
    FROM
      t_1_I AS t_2_I
    WHERE
      (t_2_I.c IS NOT null) AND
      (t_2_I.t = "x")
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.c AS c,
  SUM(Q_MultBodyAggAux.s) AS s
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1 ORDER BY c NULLS LAST;