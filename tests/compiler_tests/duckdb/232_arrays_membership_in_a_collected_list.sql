-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_L AS (SELECT
  ARRAY_AGG(x_8.unnested_pod) AS l
FROM
  (select unnest([1, 3]) as unnested_pod) as x_8)
SELECT
  x_3.unnested_pod AS x
FROM
  t_1_L AS t_0_L, (select unnest(t_0_L.l) as unnested_pod) as x_3, (select unnest([1, 2, 3]) as unnested_pod) as x_5
WHERE
  (x_5.unnested_pod = x_3.unnested_pod) ORDER BY x;