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
  P.id AS a,
  t_0_P.id AS b
FROM
  t_1_P AS P, t_1_P AS t_0_P, (select unnest(P.r.tags) as unnested_pod) as x_6, (select unnest(t_0_P.r.tags) as unnested_pod) as x_7
WHERE
  (P.id < t_0_P.id) AND
  (x_6.unnested_pod IS NOT DISTINCT FROM x_7.unnested_pod)
GROUP BY P.id, t_0_P.id ORDER BY a, b;