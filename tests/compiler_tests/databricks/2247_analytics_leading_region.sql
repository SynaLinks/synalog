WITH t_3_S AS (SELECT * FROM VALUES
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
t_2_T AS (SELECT
  S.r AS r,
  SUM(S.v) AS t
FROM
  t_3_S AS S
GROUP BY 1)
SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(t_0_T.t AS value, t_0_T.r AS arg)), false)[0].arg AS r
FROM
  t_2_T AS t_0_T;
