WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      'ada' AS name,
      'ada@analytical.org' AS email
   UNION ALL
  
    SELECT
      'ken' AS name,
      'ken@bell-labs.com' AS email
  
) AS UNUSED_TABLE_NAME  )
SELECT
  E.name AS name,
  (CASE WHEN ((JSON_ARRAY_LENGTH(SPLIT(E.email, '.'))) - (1)) < 0 THEN NULL ELSE JSON_EXTRACT(SPLIT(E.email, '.'), '$[' || ((JSON_ARRAY_LENGTH(SPLIT(E.email, '.'))) - (1)) || ']') END) AS tld
FROM
  t_0_E AS E ORDER BY name NULLS LAST;