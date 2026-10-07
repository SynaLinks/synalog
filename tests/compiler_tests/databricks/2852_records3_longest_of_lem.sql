WITH t_2_B AS (SELECT * FROM VALUES
  (1, "Dune", "herbert", 1965, 412, true),
  (2, "Emma", "austen", 1815, 474, false),
  (3, "Ubik", "dick", 1969, 202, true),
  (4, "Kim", "kipling", 1901, 368, false),
  (5, "Solaris", "lem", 1961, 204, true),
  (6, "Persuasion", "austen", 1817, 249, false),
  (7, "Valis", "dick", 1981, 271, true)
AS UNUSED_TABLE_NAME(id, title, author, year, pages, sf)),
t_0_L AS (SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(B.pages AS value, STRUCT(B.title AS title, B.pages AS pages) AS arg)), false)[0].arg AS best
FROM
  t_2_B AS B
WHERE
  (B.author = "lem"))
SELECT
  L.best.title AS title,
  L.best.pages AS pages
FROM
  t_0_L AS L;