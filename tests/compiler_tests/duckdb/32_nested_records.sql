-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord315011332
drop type if exists synalogrecord315011332 cascade; create type synalogrecord315011332 as struct(email text, phone text);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);

-- Synalog type: synalogrecord257158727
drop type if exists synalogrecord257158727 cascade; create type synalogrecord257158727 as struct(person_email text, person_name text);

-- Synalog type: synalogrecord836374436
drop type if exists synalogrecord836374436 cascade; create type synalogrecord836374436 as struct(contact synalogrecord315011332, name text);
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