WITH t_1_Loan AS (SELECT * FROM VALUES
  ("ana", 1, "2026-01-03", "2026-01-20"),
  ("ana", 4, "2026-02-01", "2026-03-15"),
  ("ben", 4, "2026-01-10", "2026-01-12"),
  ("ben", 5, "2026-02-11", "2026-02-25"),
  ("ben", 6, "2026-03-01", "2026-04-02"),
  ("cy", 8, "2026-01-05", "2026-02-28"),
  ("cy", 9, "2026-03-01", "2026-03-09"),
  ("cy", 10, "2026-03-03", "2026-03-04"),
  ("ana", 2, "2026-03-20", "2026-03-30"),
  ("ana", 3, "2026-04-01", "2026-04-10")
AS UNUSED_TABLE_NAME(member, book, out, back)),
t_2_Book AS (SELECT * FROM VALUES
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
  SUM(1) AS n
FROM
  t_1_Loan AS Loan, t_2_Book AS t_0_Book
WHERE
  (t_0_Book.id = Loan.book) AND
  (t_0_Book.author = "asimov");
