WITH t_0_Words AS (SELECT * FROM (
  
    SELECT
      "apple" AS word
   UNION ALL
  
    SELECT
      "banana" AS word
   UNION ALL
  
    SELECT
      "cherry" AS word
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (SELECT
  MAX(Words.word) AS logica_value
FROM
  t_0_Words AS Words) AS longest ORDER BY longest;