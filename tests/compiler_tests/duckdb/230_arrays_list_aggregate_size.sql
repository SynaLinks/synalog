-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_L AS (SELECT
  ARRAY_AGG(x_3.unnested_pod) AS l
FROM
  (select unnest([1, 1, 2]) as unnested_pod) as x_3)
SELECT
  LEN(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L;