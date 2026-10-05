-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  CAST(SUBSTR(x_2.unnested_pod, 9, 2) AS BIGINT) AS day
FROM
  (select unnest(['2024-01-31', '2024-02-01']) as unnested_pod) as x_2 ORDER BY day;
