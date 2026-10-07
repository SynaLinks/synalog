WITH t_1_Loan AS (SELECT * FROM (
  
    SELECT
      "ana" AS member,
      1 AS book,
      "2026-01-03" AS out,
      "2026-01-20" AS back
   UNION ALL
  
    SELECT
      "ana" AS member,
      4 AS book,
      "2026-02-01" AS out,
      "2026-03-15" AS back
   UNION ALL
  
    SELECT
      "ben" AS member,
      4 AS book,
      "2026-01-10" AS out,
      "2026-01-12" AS back
   UNION ALL
  
    SELECT
      "ben" AS member,
      5 AS book,
      "2026-02-11" AS out,
      "2026-02-25" AS back
   UNION ALL
  
    SELECT
      "ben" AS member,
      6 AS book,
      "2026-03-01" AS out,
      "2026-04-02" AS back
   UNION ALL
  
    SELECT
      "cy" AS member,
      8 AS book,
      "2026-01-05" AS out,
      "2026-02-28" AS back
   UNION ALL
  
    SELECT
      "cy" AS member,
      9 AS book,
      "2026-03-01" AS out,
      "2026-03-09" AS back
   UNION ALL
  
    SELECT
      "cy" AS member,
      10 AS book,
      "2026-03-03" AS out,
      "2026-03-04" AS back
   UNION ALL
  
    SELECT
      "ana" AS member,
      2 AS book,
      "2026-03-20" AS out,
      "2026-03-30" AS back
   UNION ALL
  
    SELECT
      "ana" AS member,
      3 AS book,
      "2026-04-01" AS out,
      "2026-04-10" AS back
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Loan.member AS member,
  Loan.book AS a,
  t_0_Loan.book AS b
FROM
  t_1_Loan AS Loan, t_1_Loan AS t_0_Loan
WHERE
  (Loan.book < t_0_Loan.book) AND
  (Loan.out < t_0_Loan.back) AND
  (t_0_Loan.out < Loan.back) AND
  (t_0_Loan.member = Loan.member);