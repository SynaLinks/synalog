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
  ((1) + (COALESCE((SELECT
  SUM(1) AS logica_value
FROM
  t_1_S AS t_0_S
WHERE
  (t_0_S.v > S.v) AND
  (t_0_S.r = "north")), 0))) AS rank
FROM
  t_1_S AS S
WHERE
  (S.r = "north") AND
  (S.d = 3);
