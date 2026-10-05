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
AS UNUSED_TABLE_NAME(r, d, v))
SELECT
  S.d AS d,
  MAX(t_0_S.v) AS m
FROM
  t_1_S AS S, t_1_S AS t_0_S
WHERE
  (t_0_S.d <= S.d) AND
  (S.r = "north") AND
  (t_0_S.r = "north")
GROUP BY 1 ORDER BY d NULLS LAST, m NULLS LAST;
