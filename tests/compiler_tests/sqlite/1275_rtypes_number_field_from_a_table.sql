WITH t_1_P AS (SELECT * FROM (
  
    SELECT
      'a' AS name,
      100 AS score
   UNION ALL
  
    SELECT
      'b' AS name,
      20 AS score
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.name AS name,
  P.score AS score
FROM
  t_1_P AS P ORDER BY score NULLS LAST;
