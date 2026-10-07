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
  (CASE WHEN ((CARDINALITY(SPLIT(E.email, '.'))) - (1)) < 0 THEN NULL ELSE ELEMENT_AT(SPLIT(E.email, '.'), ((CARDINALITY(SPLIT(E.email, '.'))) - (1)) + 1) END) AS tld
FROM
  t_0_E AS E ORDER BY name;