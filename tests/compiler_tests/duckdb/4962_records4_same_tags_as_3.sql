-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      {name: 'ann', home: {city: 'paris'}, age: 31, tags: ['a', 'b']} AS r
   UNION ALL
  
    SELECT
      2 AS id,
      {name: 'bob', home: {city: 'oslo'}, age: null, tags: []} AS r
   UNION ALL
  
    SELECT
      3 AS id,
      {name: 'cid', home: {city: 'paris'}, age: 45, tags: ['c']} AS r
   UNION ALL
  
    SELECT
      4 AS id,
      {name: 'dee', home: {city: null}, age: 22, tags: ['a']} AS r
   UNION ALL
  
    SELECT
      5 AS id,
      {name: 'eve', home: {city: 'rome'}, age: 38, tags: ['b', 'c', 'd']} AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_P.id AS id
FROM
  t_1_P AS P, t_1_P AS t_0_P
WHERE
  (t_0_P.id IS DISTINCT FROM 3) AND
  (P.id = 3) AND
  (t_0_P.r.tags IS NOT DISTINCT FROM P.r.tags) ORDER BY id;