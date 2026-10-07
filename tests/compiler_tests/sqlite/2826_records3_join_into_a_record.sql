WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Dune' AS title,
      'herbert' AS author,
      1965 AS year,
      412 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      2 AS id,
      'Emma' AS title,
      'austen' AS author,
      1815 AS year,
      474 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      3 AS id,
      'Ubik' AS title,
      'dick' AS author,
      1969 AS year,
      202 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      4 AS id,
      'Kim' AS title,
      'kipling' AS author,
      1901 AS year,
      368 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      5 AS id,
      'Solaris' AS title,
      'lem' AS author,
      1961 AS year,
      204 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      6 AS id,
      'Persuasion' AS title,
      'austen' AS author,
      1817 AS year,
      249 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      7 AS id,
      'Valis' AS title,
      'dick' AS author,
      1981 AS year,
      271 AS pages,
      true AS sf
  
) AS UNUSED_TABLE_NAME  ),
t_1_Au AS (SELECT * FROM (
  
    SELECT
      'austen' AS author,
      'Austen' AS display
   UNION ALL
  
    SELECT
      'dick' AS author,
      'Dick' AS display
   UNION ALL
  
    SELECT
      'herbert' AS author,
      'Herbert' AS display
   UNION ALL
  
    SELECT
      'kipling' AS author,
      'Kipling' AS display
   UNION ALL
  
    SELECT
      'lem' AS author,
      'Lem' AS display
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B.title AS title,
  Au.display AS "by"
FROM
  t_0_B AS B, t_1_Au AS Au
WHERE
  (Au.author = B.author) ORDER BY title NULLS LAST, "by" NULLS LAST;