-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord711127378
drop type if exists logicarecord711127378 cascade; create type logicarecord711127378 as struct(age double, name text);

-- Logica type: logicarecord197251438
drop type if exists logicarecord197251438 cascade; create type logicarecord197251438 as struct(sum double, x double, y double);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);

-- Logica type: logicarecord363194488
drop type if exists logicarecord363194488 cascade; create type logicarecord363194488 as struct(department text, person logicarecord711127378);
WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      {name: E'Alice', age: 30} AS info
   UNION ALL
  
    SELECT
      {name: E'Bob', age: 25} AS info
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.info.name AS name
FROM
  t_0_Person AS Person ORDER BY name;