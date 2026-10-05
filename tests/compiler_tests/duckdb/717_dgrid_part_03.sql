-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_3.unnested_pod AS d,
  CAST(SUBSTR(x_3.unnested_pod, 9, 2) AS BIGINT) AS p
FROM
  (select unnest(['2024-03-09', '2023-11-30', '2024-01-15']) as unnested_pod) as x_3 ORDER BY d;
