WITH t_2_Phones AS (SELECT * FROM (
  
    SELECT
      "Alice" AS person,
      "555-1234" AS phone
   UNION ALL
  
    SELECT
      "Bob" AS person,
      "555-5678" AS phone
  
) AS UNUSED_TABLE_NAME  ),
t_3_Emails AS (SELECT * FROM (
  
    SELECT
      "Bob" AS person,
      "bob@example.com" AS email
   UNION ALL
  
    SELECT
      "Charlie" AS person,
      "charlie@example.com" AS email
  
) AS UNUSED_TABLE_NAME  ),
t_1_ContactInfo_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Phones.person AS person,
      ARRAY[Phones.phone] AS phones,
      ARRAY[] AS emails
    FROM
      t_2_Phones AS Phones
   UNION ALL
  
    SELECT
      Emails.person AS person,
      ARRAY[] AS phones,
      ARRAY[Emails.email] AS emails
    FROM
      t_3_Emails AS Emails
  
) AS UNUSED_TABLE_NAME  ),
t_0_ContactInfo AS (SELECT
  ContactInfo_MultBodyAggAux.person AS person,
  ARRAY_CONCAT_AGG(ContactInfo_MultBodyAggAux.phones) AS phones,
  ARRAY_CONCAT_AGG(ContactInfo_MultBodyAggAux.emails) AS emails
FROM
  t_1_ContactInfo_MultBodyAggAux AS ContactInfo_MultBodyAggAux
GROUP BY person ORDER BY person)
SELECT
  ContactInfo.person AS person,
  ContactInfo.phones AS phones,
  ContactInfo.emails AS emails
FROM
  t_0_ContactInfo AS ContactInfo ORDER BY person;