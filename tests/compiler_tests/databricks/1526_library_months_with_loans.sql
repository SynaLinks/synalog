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
  SUBSTR(Loan.out, 1, 7) AS month
FROM
  t_0_Loan AS Loan
GROUP BY 1 ORDER BY month NULLS LAST;
