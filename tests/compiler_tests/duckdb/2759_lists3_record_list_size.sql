-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      {name: 'a', tags: ['x', 'y']} AS r
   UNION ALL
  
    SELECT
      2 AS id,
      {name: 'b', tags: []} AS r
   UNION ALL
  
    SELECT
      3 AS id,
      {name: 'c', tags: ['y']} AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.id AS id,
  LEN(t_0_R.r.tags) AS n
FROM
  t_1_R AS t_0_R ORDER BY id, n;