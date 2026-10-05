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
  ELEMENT_AT(SPLIT(E.email, '.'), ((CARDINALITY(SPLIT(E.email, '.'))) - (1)) + 1) AS tld
FROM
  t_0_E AS E ORDER BY name;
