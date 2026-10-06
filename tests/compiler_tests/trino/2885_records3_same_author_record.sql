DROP TABLE IF EXISTS logica_test.A;
CREATE TABLE logica_test.A AS WITH t_0_B AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B.id AS id,
  CAST(ROW(B.author) AS ROW(author varchar)) AS r
FROM
  t_0_B AS B;

-- Interacting with table logica_test.A

SELECT
  t_0_A.id AS a,
  t_1_A.id AS b
FROM
  logica_test.A AS t_0_A, logica_test.A AS t_1_A
WHERE
  (t_0_A.id < t_1_A.id) AND
  (t_1_A.r = t_0_A.r) ORDER BY a, b;