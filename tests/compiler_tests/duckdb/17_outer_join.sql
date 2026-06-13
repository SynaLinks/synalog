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
WITH t_1_Phones AS (SELECT * FROM (
  
    SELECT
      E'Alice' AS person,
      E'555-1234' AS phone
   UNION ALL
  
    SELECT
      E'Bob' AS person,
      E'555-5678' AS phone
  
) AS UNUSED_TABLE_NAME  ),
t_2_Emails AS (SELECT * FROM (
  
    SELECT
      E'Bob' AS person,
      E'bob@example.com' AS email
   UNION ALL
  
    SELECT
      E'Charlie' AS person,
      E'charlie@example.com' AS email
  
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