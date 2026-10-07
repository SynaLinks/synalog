WITH t_3_S AS (SELECT * FROM VALUES
  (1, "north", "ax", 3, 10.0E0),
  (2, "north", "ax", null, 10.0E0),
  (3, "north", "bo", 5, 4.0E0),
  (4, "south", "ax", 1, 12.0E0),
  (5, "south", "cy", 7, null),
  (6, "south", "cy", 2, 3.0E0),
  (7, "east", "bo", null, null),
  (8, null, "ax", 4, 9.0E0),
  (9, null, "dz", 6, 1.0E0),
  (10, "east", "dz", 8, 2.0E0),
  (11, "north", "cy", 3, 6.0E0),
  (12, "west", "ax", 9, 10.0E0)
AS UNUSED_TABLE_NAME(id, r, p, q, pr)),
t_2_T AS (SELECT
  S.p AS p,
  SUM(S.q) AS t
FROM
  t_3_S AS S
GROUP BY 1)
SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(t_0_T.t AS value, t_0_T.p AS arg)), false)[0].arg AS b
FROM
  t_2_T AS t_0_T;