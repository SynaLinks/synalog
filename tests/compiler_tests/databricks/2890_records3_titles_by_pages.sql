WITH t_8_B AS (SELECT * FROM VALUES
  (1, "Dune", "herbert", 1965, 412, true),
  (2, "Emma", "austen", 1815, 474, false),
  (3, "Ubik", "dick", 1969, 202, true),
  (4, "Kim", "kipling", 1901, 368, false),
  (5, "Solaris", "lem", 1961, 204, true),
  (6, "Persuasion", "austen", 1817, 249, false),
  (7, "Valis", "dick", 1981, 271, true)
AS UNUSED_TABLE_NAME(id, title, author, year, pages, sf)),
t_5_L AS (SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(B.pages AS arg, STRUCT(B.title AS t) AS value))), s -> s.value) AS l
FROM
  t_8_B AS B),
t_0_J AS (SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(x_12 AS arg, ELEMENT_AT(t_4_L.l, x_12 + 1).t AS value))), s -> s.value) AS s
FROM
  t_5_L AS t_4_L, LATERAL (SELECT explode(FILTER(SEQUENCE(0, ARRAY_SIZE(t_4_L.l)), x -> x < ARRAY_SIZE(t_4_L.l))) AS x_12) AS pushkin)
SELECT
  ARRAY_JOIN(J.s, ", ") AS s
FROM
  t_0_J AS J;