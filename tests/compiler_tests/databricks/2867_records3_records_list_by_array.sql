WITH t_8_V AS (SELECT * FROM VALUES
  (3, "b"),
  (1, "c"),
  (2, "a")
AS UNUSED_TABLE_NAME(k, n)),
t_5_L AS (SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(V.k AS arg, STRUCT(V.n AS n) AS value))), s -> s.value) AS l
FROM
  t_8_V AS V),
t_0_J AS (SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(x_12 AS arg, ELEMENT_AT(t_4_L.l, x_12 + 1).n AS value))), s -> s.value) AS s
FROM
  t_5_L AS t_4_L, LATERAL (SELECT explode(FILTER(SEQUENCE(0, ARRAY_SIZE(t_4_L.l)), x -> x < ARRAY_SIZE(t_4_L.l))) AS x_12) AS pushkin)
SELECT
  ARRAY_JOIN(J.s, "-") AS s
FROM
  t_0_J AS J;