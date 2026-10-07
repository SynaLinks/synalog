-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord520744032
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord520744032') then create type logicarecord520744032 as (c numeric); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
-- Logica type: logicarecord51356806
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord51356806') then create type logicarecord51356806 as (b logicarecord520744032); end if;
-- Logica type: logicarecord33862796
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord33862796') then create type logicarecord33862796 as (a logicarecord51356806); end if;
END $$;
SELECT
  ((ROW(ROW(7)::logicarecord520744032)::logicarecord51356806).b).c AS v;