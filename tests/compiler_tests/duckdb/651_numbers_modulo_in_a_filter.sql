-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_1.unnested_pod AS x
FROM
  (select unnest(Range(10)) as unnested_pod) as x_1
WHERE
  (x_1.unnested_pod > 0) AND
  (((x_1.unnested_pod) % NULLIF(3, 0)) = 0) ORDER BY x;