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
AS UNUSED_TABLE_NAME(r, d, v))
SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(S.d AS value, S.v AS arg)))[0].arg AS first,
  SORT_ARRAY(COLLECT_LIST(STRUCT(S.d AS value, S.v AS arg)), false)[0].arg AS last
FROM
  t_2_S AS S
WHERE
  (S.r = "south");
