WITH t_1_I AS (SELECT * FROM VALUES
  (1, "red", 10, null),
  (2, "blue", 25, "x"),
  (3, "red", 40, "y"),
  (4, "green", 5, null),
  (5, "blue", 60, "x"),
  (6, null, 30, "z"),
  (7, "green", 45, "y")
AS UNUSED_TABLE_NAME(id, c, p, t)),
t_6_P AS (SELECT * FROM VALUES
  (1, 2),
  (2, 3),
  (4, 4),
  (5, 1),
  (7, 6)
AS UNUSED_TABLE_NAME(a, b)),
t_4_Paired_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_5_P.a AS x
    FROM
      t_6_P AS t_5_P
   UNION ALL
  
    SELECT
      t_7_P.b AS x
    FROM
      t_6_P AS t_7_P
  
) AS UNUSED_TABLE_NAME  ),
t_3_Paired AS (SELECT
  Paired_MultBodyAggAux.x AS x
FROM
  t_4_Paired_MultBodyAggAux AS Paired_MultBodyAggAux
GROUP BY 1),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      I.id AS id
    FROM
      t_1_I AS I
    WHERE
      (I.c = "green")
   UNION ALL
  
    SELECT
      t_2_I.id AS id
    FROM
      t_1_I AS t_2_I
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        t_3_Paired AS Paired
      WHERE
        (Paired.x = t_2_I.id)) IS NULL)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.id AS id
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1 ORDER BY id NULLS LAST;