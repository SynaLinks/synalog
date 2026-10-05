-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_Squares AS (SELECT
  ARRAY_AGG(((x_7) * (x_7)) order by x_7) AS logica_value
FROM
  UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 5 - 1) as x), '{}')) as x_7),
t_3_EvenSquares AS (SELECT
  ARRAY_AGG(((x_14) * (x_14)) order by x_14) AS logica_value
FROM
  UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_14
WHERE
  ((MOD(x_14, 2)) = 0))
SELECT
  t_0_Squares.logica_value AS squares,
  EvenSquares.logica_value AS even_squares
FROM
  t_1_Squares AS t_0_Squares, t_3_EvenSquares AS EvenSquares;