WITH t_0_Loan AS (SELECT * FROM VALUES
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
AS UNUSED_TABLE_NAME(member, book, out, back))
SELECT
  Loan.member AS member,
  Loan.book AS book
FROM
  t_0_Loan AS Loan
WHERE
  (Loan.back > (CONCAT((CONCAT(SUBSTR(Loan.out, 1, 5), CASE WHEN (SUBSTR(Loan.out, 6, 2) = "01") THEN "02" WHEN (SUBSTR(Loan.out, 6, 2) = "02") THEN "03" WHEN (SUBSTR(Loan.out, 6, 2) = "03") THEN "04" ELSE "05" END)), SUBSTR(Loan.out, 8, 3)))) ORDER BY member NULLS LAST, book NULLS LAST;
