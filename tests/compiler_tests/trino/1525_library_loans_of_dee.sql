WITH t_1_Loan AS (SELECT * FROM (
  
    SELECT
      'ana' AS member,
      1 AS book,
      '2026-01-03' AS out,
      '2026-01-20' AS back
   UNION ALL
  
    SELECT
      'ana' AS member,
      4 AS book,
      '2026-02-01' AS out,
      '2026-03-15' AS back
   UNION ALL
  
    SELECT
      'ben' AS member,
      4 AS book,
      '2026-01-10' AS out,
      '2026-01-12' AS back
   UNION ALL
  
    SELECT
      'ben' AS member,
      5 AS book,
      '2026-02-11' AS out,
      '2026-02-25' AS back
   UNION ALL
  
    SELECT
      'ben' AS member,
      6 AS book,
      '2026-03-01' AS out,
      '2026-04-02' AS back
   UNION ALL
  
    SELECT
      'cy' AS member,
      8 AS book,
      '2026-01-05' AS out,
      '2026-02-28' AS back
   UNION ALL
  
    SELECT
      'cy' AS member,
      9 AS book,
      '2026-03-01' AS out,
      '2026-03-09' AS back
   UNION ALL
  
    SELECT
      'cy' AS member,
      10 AS book,
      '2026-03-03' AS out,
      '2026-03-04' AS back
   UNION ALL
  
    SELECT
      'ana' AS member,
      2 AS book,
      '2026-03-20' AS out,
      '2026-03-30' AS back
   UNION ALL
  
    SELECT
      'ana' AS member,
      3 AS book,
      '2026-04-01' AS out,
      '2026-04-10' AS back
  
) AS UNUSED_TABLE_NAME  ),
t_2_Book AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'The Hobbit' AS title,
      'tolkien' AS author,
      1937 AS year
   UNION ALL
  
    SELECT
      2 AS id,
      'The Fellowship' AS title,
      'tolkien' AS author,
      1954 AS year
   UNION ALL
  
    SELECT
      3 AS id,
      'The Two Towers' AS title,
      'tolkien' AS author,
      1954 AS year
   UNION ALL
  
    SELECT
      4 AS id,
      'Dune' AS title,
      'herbert' AS author,
      1965 AS year
   UNION ALL
  
    SELECT
      5 AS id,
      'Dune Messiah' AS title,
      'herbert' AS author,
      1969 AS year
   UNION ALL
  
    SELECT
      6 AS id,
      'Emma' AS title,
      'austen' AS author,
      1815 AS year
   UNION ALL
  
    SELECT
      7 AS id,
      'Persuasion' AS title,
      'austen' AS author,
      1817 AS year
   UNION ALL
  
    SELECT
      8 AS id,
      'Neuromancer' AS title,
      'gibson' AS author,
      1984 AS year
   UNION ALL
  
    SELECT
      9 AS id,
      'Count Zero' AS title,
      'gibson' AS author,
      1986 AS year
   UNION ALL
  
    SELECT
      10 AS id,
      'Foundation' AS title,
      'asimov' AS author,
      1951 AS year
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_Book.title AS title
FROM
  t_1_Loan AS Loan, t_2_Book AS t_0_Book
WHERE
  (Loan.member = 'dee') AND
  (t_0_Book.id = Loan.book)
GROUP BY 1;
