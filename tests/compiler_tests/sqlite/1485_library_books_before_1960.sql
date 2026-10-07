WITH t_0_Book AS (SELECT * FROM (
  
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
  SUM(1) AS n
FROM
  t_0_Book AS Book
WHERE
  (Book.year < 1960);