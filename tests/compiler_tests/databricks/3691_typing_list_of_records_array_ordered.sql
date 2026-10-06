WITH t_4_V AS (SELECT * FROM VALUES
  (2, "a"),
  (1, "b")
AS UNUSED_TABLE_NAME(k, n)),
t_1_L AS (SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(V.k AS arg, STRUCT(V.n AS n) AS value))), s -> s.value) AS l
FROM
  t_4_V AS V)
SELECT
  ELEMENT_AT(t_0_L.l, 0 + 1).n AS n
FROM
  t_1_L AS t_0_L;