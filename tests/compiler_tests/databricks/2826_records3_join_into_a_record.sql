WITH t_0_B AS (SELECT * FROM VALUES
  (1, "Dune", "herbert", 1965, 412, true),
  (2, "Emma", "austen", 1815, 474, false),
  (3, "Ubik", "dick", 1969, 202, true),
  (4, "Kim", "kipling", 1901, 368, false),
  (5, "Solaris", "lem", 1961, 204, true),
  (6, "Persuasion", "austen", 1817, 249, false),
  (7, "Valis", "dick", 1981, 271, true)
AS UNUSED_TABLE_NAME(id, title, author, year, pages, sf)),
t_1_Au AS (SELECT * FROM VALUES
  ("austen", "Austen"),
  ("dick", "Dick"),
  ("herbert", "Herbert"),
  ("kipling", "Kipling"),
  ("lem", "Lem")
AS UNUSED_TABLE_NAME(author, display))
SELECT
  B.title AS title,
  Au.display AS `by`
FROM
  t_0_B AS B, t_1_Au AS Au
WHERE
  (Au.author = B.author) ORDER BY title NULLS LAST, `by` NULLS LAST;