WITH t_0_Words AS (SELECT * FROM (
  
    SELECT
      'apple' AS word
   UNION ALL
  
    SELECT
      'banana' AS word
   UNION ALL
  
    SELECT
      'cherry' AS word
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (SELECT
  MAX(MagicalEntangle(Words.word, x_6.value)) AS logica_value
FROM
  t_0_Words AS Words, JSON_EACH(JSON_ARRAY(0)) as x_6) AS longest ORDER BY longest;