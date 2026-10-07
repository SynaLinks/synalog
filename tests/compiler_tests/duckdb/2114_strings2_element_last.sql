-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  (CASE WHEN ((LEN(SPLIT('a,b,c', ','))) - (1)) < 0 THEN NULL ELSE array_extract(SPLIT('a,b,c', ','), CAST(((LEN(SPLIT('a,b,c', ','))) - (1)) + 1 AS BIGINT)) END) AS s;