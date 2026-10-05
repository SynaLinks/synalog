-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_A AS (SELECT
  AVG(x_3.unnested_pod) AS a
FROM
  (select unnest([1, 2, 4]) as unnested_pod) as x_3)
SELECT
  ROUND(t_0_A.a, 2) AS r
FROM
  t_1_A AS t_0_A;