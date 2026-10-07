WITH t_2_I AS (SELECT * FROM VALUES
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
      t_1_I.id AS id
    FROM
      t_2_I AS I, t_2_I AS t_1_I
    WHERE
      (t_1_I.id != 2) AND
      (I.id = 2) AND
      (t_1_I.c = I.c)
   UNION ALL
  
    SELECT
      t_4_I.id AS id
    FROM
      t_2_I AS t_3_I, t_2_I AS t_4_I
    WHERE
      (t_4_I.id != 2) AND
      (t_3_I.id = 2) AND
      (t_4_I.t = t_3_I.t)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.id AS id
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1 ORDER BY id NULLS LAST;