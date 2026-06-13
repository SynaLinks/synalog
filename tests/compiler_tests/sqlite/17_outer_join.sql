WITH t_1_Phones AS (SELECT * FROM (
  
    SELECT
      'Alice' AS person,
      '555-1234' AS phone
   UNION ALL
  
    SELECT
      'Bob' AS person,
      '555-5678' AS phone
  
) AS UNUSED_TABLE_NAME  ),
t_2_Emails AS (SELECT * FROM (
  
    SELECT
      'Bob' AS person,
      'bob@example.com' AS email
   UNION ALL
  
    SELECT
      'Charlie' AS person,
      'charlie@example.com' AS email
  
) AS UNUSED_TABLE_NAME  ),
t_0_PersonSummary_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Phones.person AS person,
      1 AS has_phone,
      0 AS has_email
    FROM
      t_1_Phones AS Phones
   UNION ALL
  
    SELECT
      Emails.person AS person,
      0 AS has_phone,
      1 AS has_email
    FROM
      t_2_Emails AS Emails
  
) AS UNUSED_TABLE_NAME  )
SELECT
  PersonSummary_MultBodyAggAux.person AS person,
  MAX(PersonSummary_MultBodyAggAux.has_phone) AS has_phone,
  MAX(PersonSummary_MultBodyAggAux.has_email) AS has_email
FROM
  t_0_PersonSummary_MultBodyAggAux AS PersonSummary_MultBodyAggAux
GROUP BY PersonSummary_MultBodyAggAux.person ORDER BY person;