-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord18303469541312490344') then create type logicarecord18303469541312490344 as ("n" text, "v" numeric); end if; END $$;
DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord7068708994890329244') then create type logicarecord7068708994890329244 as ("a" logicarecord18303469541312490344); end if; END $$;
SELECT
  ((x_1).a).n AS n,
  ((x_1).a).v AS v
FROM
  LATERAL (SELECT UNNEST(ARRAY[ROW(ROW('p', 1)::logicarecord18303469541312490344)::logicarecord7068708994890329244, ROW(ROW('q', 2)::logicarecord18303469541312490344)::logicarecord7068708994890329244]) AS x_1) AS pushkin_x_1 ORDER BY n;