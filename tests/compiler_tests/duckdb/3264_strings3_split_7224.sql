-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  LEN(SPLIT('aaa', 'aa')) AS n,
  (CASE WHEN 0 < 0 THEN NULL ELSE array_extract(SPLIT('aaa', 'aa'), CAST(0 + 1 AS BIGINT)) END) AS first,
  (CASE WHEN ((LEN(SPLIT('aaa', 'aa'))) - (1)) < 0 THEN NULL ELSE array_extract(SPLIT('aaa', 'aa'), CAST(((LEN(SPLIT('aaa', 'aa'))) - (1)) + 1 AS BIGINT)) END) AS last;