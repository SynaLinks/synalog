WITH t_1_S AS (SELECT * FROM VALUES
  ("north", 1, 5),
  ("north", 2, 8),
  ("north", 3, 3),
  ("north", 5, 9),
  ("north", 6, 1),
  ("south", 1, 7),
  ("south", 2, 7),
  ("south", 4, 2),
  ("south", 5, 6),
  ("east", 2, 4),
  ("east", 3, 11),
  ("east", 4, 6),
  ("east", 5, 10),
  ("east", 7, 3)
AS UNUSED_TABLE_NAME(r, d, v)),
t_3_Better_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_4_S.d AS d,
      1 AS n
    FROM
      t_1_S AS t_4_S, t_1_S AS t_5_S
    WHERE
      (t_5_S.v > t_4_S.v) AND
      (t_4_S.r = "north") AND
      (t_5_S.r = "north")
   UNION ALL
  
    SELECT
      t_6_S.d AS d,
      1 AS n
    FROM
      t_1_S AS t_6_S, t_1_S AS t_7_S
    WHERE
      (t_7_S.d < t_6_S.d) AND
      (t_6_S.r = "north") AND
      (t_7_S.r = "north") AND
      (t_7_S.v = t_6_S.v)
  
) AS UNUSED_TABLE_NAME  ),
t_2_Better AS (SELECT
  Better_MultBodyAggAux.d AS d,
  SUM(Better_MultBodyAggAux.n) AS n
FROM
  t_3_Better_MultBodyAggAux AS Better_MultBodyAggAux
GROUP BY 1),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      S.d AS d,
      S.v AS v
    FROM
      t_1_S AS S
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        t_2_Better AS Better
      WHERE
        (Better.d = S.d)) IS NULL) AND
      (S.r = "north")
   UNION ALL
  
    SELECT
      t_8_S.d AS d,
      t_8_S.v AS v
    FROM
      t_1_S AS t_8_S, t_2_Better AS t_9_Better
    WHERE
      (t_9_Better.n < 3) AND
      (t_8_S.r = "north") AND
      (t_9_Better.d = t_8_S.d)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.d AS d,
  Q_MultBodyAggAux.v AS v
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1, 2 ORDER BY d NULLS LAST, v NULLS LAST;
