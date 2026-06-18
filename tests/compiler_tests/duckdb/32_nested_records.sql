-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord315011332
drop type if exists logicarecord315011332 cascade; create type logicarecord315011332 as struct(email text, phone text);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);

-- Logica type: logicarecord257158727
drop type if exists logicarecord257158727 cascade; create type logicarecord257158727 as struct(person_email text, person_name text);

-- Logica type: logicarecord836374436
drop type if exists logicarecord836374436 cascade; create type logicarecord836374436 as struct(contact logicarecord315011332, name text);
WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      {name: 'Alice', contact: {email: 'alice@example.com', phone: '123'}} AS info
   UNION ALL
  
    SELECT
      2 AS id,
      {name: 'Bob', contact: {email: 'bob@example.com', phone: '456'}} AS info
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.id AS id,
  Person.info.name AS name,
  Person.info.contact.email AS email
FROM
  t_0_Person AS Person ORDER BY id;