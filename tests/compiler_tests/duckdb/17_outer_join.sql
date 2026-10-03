-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_2_Phones AS (SELECT * FROM (
  
    SELECT
      'Alice' AS person,
      '555-1234' AS phone
   UNION ALL
  
    SELECT
      'Bob' AS person,
      '555-5678' AS phone
  
) AS UNUSED_TABLE_NAME  ),
t_3_Emails AS (SELECT * FROM (
  
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
      Phones.person AS person,
      [Phones.phone]::text[] AS phones,
      []::text[] AS emails
    FROM
      t_2_Phones AS Phones
   UNION ALL
  
    SELECT
      Emails.person AS person,
      []::text[] AS phones,
      [Emails.email]::text[] AS emails
    FROM
      t_3_Emails AS Emails
  
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