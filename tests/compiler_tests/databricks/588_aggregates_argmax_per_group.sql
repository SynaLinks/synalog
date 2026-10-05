WITH t_1_V AS (SELECT * FROM VALUES
  ("x", "a", 1),
  ("x", "b", 2),
  ("y", "c", 7)
AS UNUSED_TABLE_NAME(g, n, s))
SELECT
  V.g AS g,
  SORT_ARRAY(COLLECT_LIST(STRUCT(V.s AS value, V.n AS arg)), false)[0].arg AS w
FROM
  t_1_V AS V
GROUP BY 1 ORDER BY g NULLS LAST;