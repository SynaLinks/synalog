-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      {name: 'a', tags: ['x'], score: 1.5E0} AS r
   UNION ALL
  
    SELECT
      2 AS id,
      {name: 'b', tags: [], score: null} AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.id AS id,
  P.r.name AS name,
  LEN(P.r.tags) AS n,
  P.r.score AS s
FROM
  t_0_P AS P ORDER BY id;