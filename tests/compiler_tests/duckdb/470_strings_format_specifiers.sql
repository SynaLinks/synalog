-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  Printf('%05d', -42) AS a,
  Printf('%.2f', 3.14159E0) AS b,
  Printf('%3s|%-3s|', 'a', 'b') AS c,
  Printf('100%%') AS d,
  Printf('%d', 1234567) AS e;