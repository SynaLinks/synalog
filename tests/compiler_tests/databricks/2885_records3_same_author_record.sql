WITH t_4_B AS (SELECT * FROM VALUES
  (1, "Dune", "herbert", 1965, 412, true),
  (2, "Emma", "austen", 1815, 474, false),
  (3, "Ubik", "dick", 1969, 202, true),
  (4, "Kim", "kipling", 1901, 368, false),
  (5, "Solaris", "lem", 1961, 204, true),
  (6, "Persuasion", "austen", 1817, 249, false),
  (7, "Valis", "dick", 1981, 271, true)
AS UNUSED_TABLE_NAME(id, title, author, year, pages, sf))
SELECT
  t_2_B.id AS a,
  t_3_B.id AS b
FROM
  t_4_B AS t_2_B, t_4_B AS t_3_B
WHERE
  (t_2_B.id < t_3_B.id) AND
  (STRUCT(t_3_B.author AS author) = STRUCT(t_2_B.author AS author)) ORDER BY a NULLS LAST, b NULLS LAST;