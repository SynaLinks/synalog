-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      {name: 'a', xs: [1, 2, 3]} AS r
   UNION ALL
  
    SELECT
      2 AS k,
      {name: 'b', xs: [4]} AS r
   UNION ALL
  
    SELECT
      3 AS k,
      {name: 'c', xs: []} AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.k AS k,
  (CASE WHEN 1 < 0 THEN NULL ELSE array_extract(S.r.xs, CAST(1 + 1 AS BIGINT)) END) AS e
FROM
  t_0_S AS S ORDER BY k;