-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_Squares AS (SELECT
  ARRAY_AGG(((x_7.unnested_pod) * (x_7.unnested_pod)) order by x_7.unnested_pod) AS logica_value
FROM
  (select unnest(Range(5)) as unnested_pod) as x_7),
t_3_EvenSquares AS (SELECT
  ARRAY_AGG(((x_14.unnested_pod) * (x_14.unnested_pod)) order by x_14.unnested_pod) AS logica_value
FROM
  (select unnest(Range(10)) as unnested_pod) as x_14
WHERE
  (((x_14.unnested_pod) % (2)) = 0))
SELECT
  t_0_Squares.logica_value AS squares,
  EvenSquares.logica_value AS even_squares
FROM
  t_1_Squares AS t_0_Squares, t_3_EvenSquares AS EvenSquares;