-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  COALESCE((SELECT
  SUM((CASE WHEN x_3.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
FROM
  (select unnest([0]) as unnested_pod) as x_3
WHERE
  (1 > 5)), 0) AS n;