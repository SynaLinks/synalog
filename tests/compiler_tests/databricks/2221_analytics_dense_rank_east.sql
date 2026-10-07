WITH t_2_S AS (SELECT * FROM VALUES
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
t_0_Val AS (SELECT
  t_1_S.v AS v
FROM
  t_2_S AS t_1_S
WHERE
  (t_1_S.r = "east")
GROUP BY 1)
SELECT
  S.d AS d,
  ((1) + (COALESCE((SELECT
  SUM(1) AS logica_value
FROM
  t_0_Val AS Val
WHERE
  (Val.v > S.v)), 0))) AS rank
FROM
  t_2_S AS S
WHERE
  (S.r = "east") ORDER BY d NULLS LAST, rank NULLS LAST;
