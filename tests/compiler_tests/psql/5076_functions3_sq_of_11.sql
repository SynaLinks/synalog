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
-- Logica type: logicarecord6083990
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord6083990') then create type logicarecord6083990 as (x numeric, y numeric); end if;
END $$;
SELECT
  ((11) * (11)) AS s,
  SQRT(((((11) * (11))) + (((4) * (4))))) AS h,
  CASE WHEN (11 > 0) THEN 1 WHEN (11 < 0) THEN -1 ELSE 0 END AS g;