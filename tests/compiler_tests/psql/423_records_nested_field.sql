-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord958681958
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord958681958') then create type logicarecord958681958 as (b numeric); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
-- Logica type: logicarecord715995786
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord715995786') then create type logicarecord715995786 as (a logicarecord958681958); end if;
END $$;
SELECT
  (ROW(5)::logicarecord958681958).b AS v;