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
  B.author AS author,
  SUM(CASE WHEN STRUCT(B.pages AS pages, (B.pages > 300) AS long).long THEN 1 ELSE 0 END) AS n
FROM
  t_0_B AS B
GROUP BY 1 ORDER BY author NULLS LAST, n NULLS LAST;