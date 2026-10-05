-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_Phones AS (SELECT * FROM (
  
    SELECT
      'Alice' AS person,
      '555-1234' AS phone
   UNION ALL
  
    SELECT
      'Bob' AS person,
      '555-5678' AS phone
  
) AS UNUSED_TABLE_NAME  ),
t_5_Emails AS (SELECT * FROM (
  
    SELECT
      'Bob' AS person,
      'bob@example.com' AS email
   UNION ALL
  
    SELECT
      'Charlie' AS person,
      'charlie@example.com' AS email
  
) AS UNUSED_TABLE_NAME  ),
t_1_ContactInfo_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_2_Phones.person AS person,
      ARRAY[t_2_Phones.phone] AS phones,
      '{}' AS emails
    FROM
      t_3_Phones AS t_2_Phones
   UNION ALL
  
    SELECT
      t_4_Emails.person AS person,
      '{}' AS phones,
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
GROUP BY ContactInfo_MultBodyAggAux.person ORDER BY person)
SELECT
  ContactInfo.person AS person,
  ContactInfo.phones AS phones,
  ContactInfo.emails AS emails
FROM
  t_0_ContactInfo AS ContactInfo ORDER BY person;