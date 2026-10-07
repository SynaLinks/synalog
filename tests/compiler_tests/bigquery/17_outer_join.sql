WITH t_3_Phones AS (SELECT * FROM (
  
    SELECT
      "Alice" AS person,
      "555-1234" AS phone
   UNION ALL
  
    SELECT
      "Bob" AS person,
      "555-5678" AS phone
  
) AS UNUSED_TABLE_NAME  ),
t_5_Emails AS (SELECT * FROM (
  
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
      t_2_Phones.person AS person,
      ARRAY[t_2_Phones.phone] AS phones,
      ARRAY[] AS emails
    FROM
      t_3_Phones AS t_2_Phones
   UNION ALL
  
    SELECT
      t_4_Emails.person AS person,
      ARRAY[] AS phones,
      ARRAY[t_4_Emails.email] AS emails
    FROM
      t_5_Emails AS t_4_Emails
  
) AS UNUSED_TABLE_NAME  ),
t_0_ContactInfo AS (SELECT
  ContactInfo_MultBodyAggAux.person AS person,
  ARRAY_CONCAT_AGG(ContactInfo_MultBodyAggAux.phones) AS phones,
  ARRAY_CONCAT_AGG(ContactInfo_MultBodyAggAux.emails) AS emails
FROM
  t_1_ContactInfo_MultBodyAggAux AS ContactInfo_MultBodyAggAux
GROUP BY person ORDER BY person NULLS LAST)
SELECT
  ContactInfo.person AS person,
  ContactInfo.phones AS phones,
  ContactInfo.emails AS emails
FROM
  t_0_ContactInfo AS ContactInfo ORDER BY person NULLS LAST;