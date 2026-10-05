WITH t_5_V AS (SELECT * FROM VALUES
  (3, "c"),
  (1, "a"),
  (2, "b")
AS UNUSED_TABLE_NAME(k, v)),
t_1_L AS (SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(t_2_V.k AS arg, t_2_V.v AS value))), s -> s.value) AS l
FROM
  t_5_V AS t_2_V)
SELECT
  ARRAY_JOIN(t_0_L.l, "-") AS s
FROM
  t_1_L AS t_0_L;