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
t_2_A AS (SELECT
  AVG(t_3_S.v) AS a
FROM
  t_1_S AS t_3_S
WHERE
  (t_3_S.r = "south"))
SELECT
  S.d AS d
FROM
  t_1_S AS S, t_2_A AS t_0_A
WHERE
  (S.v > t_0_A.a) AND
  (S.r = "south") ORDER BY d NULLS LAST;
