-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

DROP TABLE IF EXISTS logica_home.T;
CREATE TABLE logica_home.T AS SELECT
  SUM(x_2.unnested_pod) AS t
FROM
  (select unnest([1, 2]) as unnested_pod) as x_2;

-- Interacting with table logica_home.T

SELECT
  t_0_T.t AS a,
  t_1_T.t AS b
FROM
  logica_home.T AS t_0_T, logica_home.T AS t_1_T;