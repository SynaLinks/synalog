WITH t_0_S AS (SELECT * FROM VALUES
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
t_2_Better_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_3_S.d AS d,
      1 AS n
    FROM
      t_0_S AS t_3_S, t_0_S AS t_4_S
    WHERE
      (t_4_S.v > t_3_S.v) AND
      (t_3_S.r = "south") AND
      (t_4_S.r = "south")
   UNION ALL
  
    SELECT
      t_5_S.d AS d,
      1 AS n
    FROM
      t_0_S AS t_5_S, t_0_S AS t_6_S
    WHERE
      (t_6_S.d < t_5_S.d) AND
      (t_5_S.r = "south") AND
      (t_6_S.r = "south") AND
      (t_6_S.v = t_5_S.v)
  
) AS UNUSED_TABLE_NAME  ),
t_1_Better AS (SELECT
  Better_MultBodyAggAux.d AS d,
  SUM(Better_MultBodyAggAux.n) AS n
FROM
  t_2_Better_MultBodyAggAux AS Better_MultBodyAggAux
GROUP BY 1)
SELECT
  S.d AS d,
  S.v AS v
FROM
  t_0_S AS S, t_1_Better AS Better
WHERE
  (S.r = "south") AND
  (Better.d = S.d) AND
  (Better.n = 1);
