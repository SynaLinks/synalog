WITH t_2_V AS (SELECT * FROM VALUES
  ("a", 3),
  ("b", 9),
  ("c", 1),
  ("d", 5)
AS UNUSED_TABLE_NAME(n, s))
SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(V.s AS arg, V.n AS value))), s -> s.value) AS l
FROM
  t_2_V AS V;