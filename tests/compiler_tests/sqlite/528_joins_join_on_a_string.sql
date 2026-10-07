WITH t_1_City AS (SELECT * FROM (
  
    SELECT
      'fr' AS code,
      'paris' AS city
   UNION ALL
  
    SELECT
      'de' AS code,
      'berlin' AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_City.code AS code,
  t_0_City.city AS city
FROM
  t_1_City AS t_0_City
WHERE
  ('fr' = t_0_City.code);