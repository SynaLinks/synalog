-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  LEN(SPLIT('one--two', '--')) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE array_extract(SPLIT('one--two', '--'), CAST(0 + 1 AS BIGINT)) END) AS first,
  (CASE WHEN ((LEN(SPLIT('one--two', '--'))) - (1)) < 0 THEN NULL ELSE array_extract(SPLIT('one--two', '--'), CAST(((LEN(SPLIT('one--two', '--'))) - (1)) + 1 AS BIGINT)) END) AS last;