-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_Boosted AS (SELECT
  x_8.unnested_pod AS x,
  x_8.unnested_pod * 100 + 1 AS boosted
FROM
  (select unnest(Range(5)) as unnested_pod) as x_8 ORDER BY x)
SELECT
  t_0_Boosted.x AS x,
  t_0_Boosted.boosted AS boosted
FROM
  t_1_Boosted AS t_0_Boosted ORDER BY x;