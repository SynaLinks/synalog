-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord18303469541312490344') then create type synalogrecord18303469541312490344 as ("n" text, "v" numeric); end if; END $$;
DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord11335855481279147171') then create type synalogrecord11335855481279147171 as ("p" synalogrecord18303469541312490344); end if; END $$;
SELECT
  ((x_1).p).n AS n,
  ((x_1).p).v AS v
FROM
  LATERAL (SELECT UNNEST(ARRAY[ROW(ROW('x', 1)::synalogrecord18303469541312490344)::synalogrecord11335855481279147171, ROW(ROW('y', 2)::synalogrecord18303469541312490344)::synalogrecord11335855481279147171]) AS x_1) AS pushkin_x_1 ORDER BY n;