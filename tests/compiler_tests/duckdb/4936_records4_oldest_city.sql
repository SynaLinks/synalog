-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord240173787
drop type if exists synalogrecord240173787 cascade; create type synalogrecord240173787 as struct(city text);

-- Synalog type: synalogrecord183863755
drop type if exists synalogrecord183863755 cascade; create type synalogrecord183863755 as struct(arg text, value numeric);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);

-- Synalog type: synalogrecord394041902
drop type if exists synalogrecord394041902 cascade; create type synalogrecord394041902 as struct(age numeric, home synalogrecord240173787, name text, tags text[]);

-- Synalog type: synalogrecord848101342
drop type if exists synalogrecord848101342 cascade; create type synalogrecord848101342 as struct(a text, v numeric);
WITH t_1_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      {name: 'ann', home: {city: 'paris'}, age: 31, tags: ['a', 'b']::text[]} AS r
   UNION ALL
  
    SELECT
      2 AS id,
      {name: 'bob', home: {city: 'oslo'}, age: null, tags: []::text[]} AS r
   UNION ALL
  
    SELECT
      3 AS id,
      {name: 'cid', home: {city: 'paris'}, age: 45, tags: ['c']::text[]} AS r
   UNION ALL
  
    SELECT
      4 AS id,
      {name: 'dee', home: {city: null}, age: 22, tags: ['a']::text[]} AS r
   UNION ALL
  
    SELECT
      5 AS id,
      {name: 'eve', home: {city: 'rome'}, age: 38, tags: ['b', 'c', 'd']::text[]} AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  argmax(P.r.home.city, P.r.age) AS c
FROM
  t_1_P AS P
WHERE
  (P.r.age IS NOT null);