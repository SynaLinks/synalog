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
-- Logica type: logicarecord907268285
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord907268285') then create type logicarecord907268285 as (x numeric); end if;
END $$;
WITH t_0_Boosted AS (SELECT
  x_8 AS x,
  x_8 * 100 + 1 AS boosted
FROM
  UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 5 - 1) as x)) as x_8 ORDER BY x)
SELECT
  Boosted.x AS x,
  Boosted.boosted AS boosted
FROM
  t_0_Boosted AS Boosted ORDER BY x;