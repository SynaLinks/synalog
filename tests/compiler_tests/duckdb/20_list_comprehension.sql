-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_Squares AS (SELECT
  ARRAY_AGG(((x_8.unnested_pod) * (x_8.unnested_pod)) order by x_8.unnested_pod) AS logica_value
FROM
  (select unnest(Range(5)) as unnested_pod) as x_8),
t_4_EvenSquares AS (SELECT
  ARRAY_AGG(((x_19.unnested_pod) * (x_19.unnested_pod)) order by x_19.unnested_pod) AS logica_value
FROM
  (select unnest(Range(10)) as unnested_pod) as x_19
WHERE
  (((x_19.unnested_pod) % NULLIF(2, 0)) = 0))
SELECT
  t_0_Squares.logica_value AS squares,
  EvenSquares.logica_value AS even_squares
FROM
  t_1_Squares AS t_0_Squares, t_4_EvenSquares AS EvenSquares;