-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord752219571
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord752219571') then create type logicarecord752219571 as (n numeric); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
-- Logica type: logicarecord122264030
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord122264030') then create type logicarecord122264030 as (inner logicarecord752219571); end if;
END $$;
SELECT
  (ROW(x_1)::logicarecord752219571).n AS n
FROM
  UNNEST(ARRAY[10, 9]::numeric[]) as x_1 ORDER BY n;