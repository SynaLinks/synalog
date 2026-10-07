WITH t_1_V AS (SELECT * FROM VALUES
  ("a", 3),
  ("b", 9),
  ("c", 1),
  ("d", 5)
AS UNUSED_TABLE_NAME(n, s))
SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(V.s AS value, V.n AS arg)), false)[0].arg AS w
FROM
  t_1_V AS V;