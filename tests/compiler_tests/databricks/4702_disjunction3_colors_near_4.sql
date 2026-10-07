WITH t_1_I AS (SELECT * FROM VALUES
  (1, "red", 10, null),
  (2, "blue", 25, "x"),
  (3, "red", 40, "y"),
  (4, "green", 5, null),
  (5, "blue", 60, "x"),
  (6, null, 30, "z"),
  (7, "green", 45, "y")
AS UNUSED_TABLE_NAME(id, c, p, t)),
t_4_P AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (4, 4),
  (5, 1),
  (7, 6)
AS UNUSED_TABLE_NAME(a, b)),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      I.c AS c
    FROM
      t_1_I AS I
    WHERE
      (I.c IS NOT null) AND
      (I.id = 4)
   UNION ALL
  
    SELECT
      t_3_I.c AS c
    FROM
      t_4_P AS t_2_P, t_1_I AS t_3_I
    WHERE
      (t_3_I.c IS NOT null) AND
      (t_2_P.a = 4) AND
      (t_3_I.id = t_2_P.b)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.c AS c
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1 ORDER BY c NULLS LAST;