WITH t_4_S AS (SELECT * FROM VALUES
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
t_1_Prev AS (SELECT
  t_2_S.d AS d,
  MAX(t_3_S.d) AS p
FROM
  t_4_S AS t_2_S, t_4_S AS t_3_S
WHERE
  (t_3_S.d < t_2_S.d) AND
  (t_2_S.r = "north") AND
  (t_3_S.r = "north")
GROUP BY 1)
SELECT
  Prev.d AS d,
  ((S.v) - (t_0_S.v)) AS delta
FROM
  t_1_Prev AS Prev, t_4_S AS S, t_4_S AS t_0_S
WHERE
  (S.r = "north") AND
  (S.d = Prev.d) AND
  (t_0_S.r = "north") AND
  (t_0_S.d = Prev.p) ORDER BY d NULLS LAST, delta NULLS LAST;
