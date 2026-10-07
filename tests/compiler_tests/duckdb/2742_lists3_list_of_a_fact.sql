-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_T AS (SELECT
  SUM(x_4.unnested_pod) AS t
FROM
  (select unnest([1, 2, 3]) as unnested_pod) as x_4)
SELECT
  3 AS n,
  t_0_T.t AS t
FROM
  t_1_T AS t_0_T;