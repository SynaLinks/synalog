WITH t_3_V AS (SELECT * FROM VALUES
  (3, "c"),
  (1, "a"),
  (2, "b")
AS UNUSED_TABLE_NAME(k, v))
SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(t_0_V.k AS arg, t_0_V.v AS value))), s -> s.value) AS l
FROM
  t_3_V AS t_0_V;