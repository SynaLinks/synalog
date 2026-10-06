WITH t_0_B AS (SELECT * FROM VALUES
  (1, "Dune", "herbert", 1965, 412, true),
  (2, "Emma", "austen", 1815, 474, false),
  (3, "Ubik", "dick", 1969, 202, true),
  (4, "Kim", "kipling", 1901, 368, false),
  (5, "Solaris", "lem", 1961, 204, true),
  (6, "Persuasion", "austen", 1817, 249, false),
  (7, "Valis", "dick", 1981, 271, true)
AS UNUSED_TABLE_NAME(id, title, author, year, pages, sf))
SELECT
  B.id AS id,
  CASE WHEN (B.year > 1966) THEN "new" ELSE "old" END AS tag,
  CASE WHEN (B.year > 1966) THEN true ELSE false END AS recent
FROM
  t_0_B AS B ORDER BY id NULLS LAST, tag NULLS LAST, recent NULLS LAST;