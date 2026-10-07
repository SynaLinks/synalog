-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  LEN(SPLIT('x||y||', '||')) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE array_extract(SPLIT('x||y||', '||'), CAST(0 + 1 AS BIGINT)) END) AS first,
  (CASE WHEN ((LEN(SPLIT('x||y||', '||'))) - (1)) < 0 THEN NULL ELSE array_extract(SPLIT('x||y||', '||'), CAST(((LEN(SPLIT('x||y||', '||'))) - (1)) + 1 AS BIGINT)) END) AS last;