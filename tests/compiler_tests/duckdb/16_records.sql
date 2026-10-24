-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord711127378
drop type if exists synalogrecord711127378 cascade; create type synalogrecord711127378 as struct(age numeric, name text);

-- Synalog type: synalogrecord197251438
drop type if exists synalogrecord197251438 cascade; create type synalogrecord197251438 as struct(sum numeric, x numeric, y numeric);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);

-- Synalog type: synalogrecord363194488
drop type if exists synalogrecord363194488 cascade; create type synalogrecord363194488 as struct(department text, person synalogrecord711127378);
WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      {name: 'Alice', age: 30} AS info
   UNION ALL
  
    SELECT
      {name: 'Bob', age: 25} AS info
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.info.name AS name
FROM
  t_0_Person AS Person ORDER BY name;