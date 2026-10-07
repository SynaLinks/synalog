WITH t_2_U AS (SELECT * FROM VALUES
  ("ann", 31),
  ("bob", 25),
  ("cid", 40),
  ("dee", 19),
  ("eve", 52),
  ("fay", 28),
  ("gus", 35)
AS UNUSED_TABLE_NAME(u, age)),
t_3_F AS (SELECT * FROM VALUES
  ("ann", "bob"),
  ("bob", "ann"),
  ("bob", "cid"),
  ("cid", "dee"),
  ("dee", "cid"),
  ("eve", "ann"),
  ("fay", "fay"),
  ("ann", "cid")
AS UNUSED_TABLE_NAME(a, b)),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_1_U.u AS u
    FROM
      t_2_U AS t_1_U
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        t_3_F AS F
      WHERE
        (F.b = t_1_U.u)) IS NULL)
   UNION ALL
  
    SELECT
      t_4_U.u AS u
    FROM
      t_2_U AS t_4_U
    WHERE
      (t_4_U.age > 40)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.u AS u
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1 ORDER BY u NULLS LAST;