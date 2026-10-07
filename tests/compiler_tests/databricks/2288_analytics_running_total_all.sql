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
t_0_Day AS (SELECT
  t_1_S.d AS d
FROM
  t_2_S AS t_1_S
GROUP BY 1)
SELECT
  Day.d AS d,
  SUM(S.v) AS t
FROM
  t_0_Day AS Day, t_2_S AS S
WHERE
  (S.d <= Day.d)
GROUP BY 1 ORDER BY d NULLS LAST, t NULLS LAST;
