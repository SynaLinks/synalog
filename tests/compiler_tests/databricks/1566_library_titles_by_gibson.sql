WITH t_0_Book AS (SELECT * FROM VALUES
  (1, "The Hobbit", "tolkien", 1937),
  (2, "The Fellowship", "tolkien", 1954),
  (3, "The Two Towers", "tolkien", 1954),
  (4, "Dune", "herbert", 1965),
  (5, "Dune Messiah", "herbert", 1969),
  (6, "Emma", "austen", 1815),
  (7, "Persuasion", "austen", 1817),
  (8, "Neuromancer", "gibson", 1984),
  (9, "Count Zero", "gibson", 1986),
  (10, "Foundation", "asimov", 1951)
AS UNUSED_TABLE_NAME(id, title, author, year))
SELECT
  Book.title AS title
FROM
  t_0_Book AS Book
WHERE
  (Book.author = "gibson") ORDER BY title NULLS LAST;
