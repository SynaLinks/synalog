-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord8617294389564608055') then create type logicarecord8617294389564608055 as ("inner" text); end if; END $$;
SELECT
  (ROW('deep')::logicarecord8617294389564608055)."inner" AS v;