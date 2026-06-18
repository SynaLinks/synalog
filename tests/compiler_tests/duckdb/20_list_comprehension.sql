-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord884343024
drop type if exists logicarecord884343024 cascade; create type logicarecord884343024 as struct(arg numeric, value numeric);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_0_Squares AS (SELECT
  ARRAY_AGG(((x_9.unnested_pod) * (x_9.unnested_pod)) order by x_9.unnested_pod) AS logica_value
FROM
  (select unnest(Range(5)) as unnested_pod) as x_9),
t_2_EvenSquares AS (SELECT
  ARRAY_AGG(((x_21.unnested_pod) * (x_21.unnested_pod)) order by x_21.unnested_pod) AS logica_value
FROM
  (select unnest(Range(10)) as unnested_pod) as x_21
WHERE
  (((x_21.unnested_pod) % (2)) = 0))
SELECT
  Squares.logica_value AS squares,
  EvenSquares.logica_value AS even_squares
FROM
  t_0_Squares AS Squares, t_2_EvenSquares AS EvenSquares;