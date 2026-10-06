WITH t_4_B AS (SELECT * FROM VALUES
  (1, "Dune", "herbert", 1965, 412, true),
  (2, "Emma", "austen", 1815, 474, false),
  (3, "Ubik", "dick", 1969, 202, true),
  (4, "Kim", "kipling", 1901, 368, false),
  (5, "Solaris", "lem", 1961, 204, true),
  (6, "Persuasion", "austen", 1817, 249, false),
  (7, "Valis", "dick", 1981, 271, true)
AS UNUSED_TABLE_NAME(id, title, author, year, pages, sf)),
t_1_L AS (SELECT
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(B.year AS arg, STRUCT(B.title AS title, B.year AS year) AS value))), s -> s.value) AS l
FROM
  t_4_B AS B
WHERE
  (B.author = "austen"))
SELECT
  ELEMENT_AT(t_0_L.l, 0 + 1).title AS title,
  ELEMENT_AT(t_0_L.l, 0 + 1).year AS year
FROM
  t_1_L AS t_0_L;