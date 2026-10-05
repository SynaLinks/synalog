WITH t_3_V AS (SELECT * FROM VALUES
  ("x", 2, 1),
  ("x", 1, 2),
  ("y", 5, 3)
AS UNUSED_TABLE_NAME(g, k, v))
SELECT
  t_0_V.g AS g,
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(t_0_V.k AS arg, t_0_V.v AS value))), s -> s.value) AS l
FROM
  t_3_V AS t_0_V
GROUP BY 1 ORDER BY g NULLS LAST;