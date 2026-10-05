-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_Squares AS (SELECT
  ARRAY_AGG(((x_8) * (x_8)) order by x_8) AS logica_value
FROM
  UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 5 - 1) as x), '{}')) as x_8),
t_4_EvenSquares AS (SELECT
  ARRAY_AGG(((x_19) * (x_19)) order by x_19) AS logica_value
FROM
  UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_19
WHERE
  ((MOD(x_19, 2)) = 0))
SELECT
  t_0_Squares.logica_value AS squares,
  EvenSquares.logica_value AS even_squares
FROM
  t_1_Squares AS t_0_Squares, t_4_EvenSquares AS EvenSquares;