WITH t_3_Phones AS (SELECT * FROM VALUES
  ("Alice", "555-1234"),
  ("Bob", "555-5678")
AS UNUSED_TABLE_NAME(person, phone)),
t_5_Emails AS (SELECT * FROM VALUES
  ("Bob", "bob@example.com"),
  ("Charlie", "charlie@example.com")
AS UNUSED_TABLE_NAME(person, email)),
t_1_ContactInfo_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_2_Phones.person AS person,
      ARRAY(t_2_Phones.phone) AS phones,
      ARRAY() AS emails
    FROM
      t_3_Phones AS t_2_Phones
   UNION ALL
  
    SELECT
      t_4_Emails.person AS person,
      ARRAY() AS phones,
      ARRAY(t_4_Emails.email) AS emails
    FROM
      t_5_Emails AS t_4_Emails
  
) AS UNUSED_TABLE_NAME  ),
t_0_ContactInfo AS (SELECT
  ContactInfo_MultBodyAggAux.person AS person,
  FLATTEN(COLLECT_LIST(ContactInfo_MultBodyAggAux.phones)) AS phones,
  FLATTEN(COLLECT_LIST(ContactInfo_MultBodyAggAux.emails)) AS emails
FROM
  t_1_ContactInfo_MultBodyAggAux AS ContactInfo_MultBodyAggAux
GROUP BY 1 ORDER BY person NULLS LAST)
SELECT
  ContactInfo.person AS person,
  ContactInfo.phones AS phones,
  ContactInfo.emails AS emails
FROM
  t_0_ContactInfo AS ContactInfo ORDER BY person NULLS LAST;