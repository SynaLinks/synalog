-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
SELECT
  x_8 AS score,
  CASE WHEN (x_8 >= 12) THEN 'A' WHEN (x_8 >= 9) THEN 'B' WHEN (x_8 >= 6) THEN 'C' WHEN (x_8 >= 3) THEN 'D' ELSE 'F' END AS letter
FROM
  UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 15 - 1) as x)) as x_8 ORDER BY score;