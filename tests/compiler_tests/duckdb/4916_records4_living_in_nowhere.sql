-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord240173787
drop type if exists logicarecord240173787 cascade; create type logicarecord240173787 as struct(city text);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);

-- Logica type: logicarecord394041902
drop type if exists logicarecord394041902 cascade; create type logicarecord394041902 as struct(age numeric, home logicarecord240173787, name text, tags text[]);
WITH t_0_P AS (SELECT * FROM (
  
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
  P.r.name AS n
FROM
  t_0_P AS P
WHERE
  (P.r.home.city = 'nowhere') ORDER BY n;