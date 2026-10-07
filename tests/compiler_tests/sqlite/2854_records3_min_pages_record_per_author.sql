WITH t_3_B AS (SELECT * FROM (
  
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
t_1_M AS (SELECT
  B.author AS author,
  (CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(ArgMin(JSON_OBJECT('title', B.title, 'v', B.pages), B.pages, 1), '$[' || 0 || ']') END) AS m
FROM
  t_3_B AS B
GROUP BY B.author)
SELECT
  t_0_M.author AS author,
  JSON_EXTRACT(t_0_M.m, "$.title") AS title,
  JSON_EXTRACT(t_0_M.m, "$.v") AS v
FROM
  t_1_M AS t_0_M ORDER BY author NULLS LAST, title NULLS LAST, v NULLS LAST;