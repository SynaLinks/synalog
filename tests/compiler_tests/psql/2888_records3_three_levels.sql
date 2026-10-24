-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Synalog type: synalogrecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord481217614') then create type synalogrecord481217614 as (r synalogrecord893574736); end if;
-- Synalog type: synalogrecord520744032
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord520744032') then create type synalogrecord520744032 as (c numeric); end if;
-- Synalog type: synalogrecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord86796764') then create type synalogrecord86796764 as (s text); end if;
-- Synalog type: synalogrecord51356806
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord51356806') then create type synalogrecord51356806 as (b synalogrecord520744032); end if;
-- Synalog type: synalogrecord33862796
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord33862796') then create type synalogrecord33862796 as (a synalogrecord51356806); end if;
END $$;
SELECT
  ((ROW(ROW(7)::synalogrecord520744032)::synalogrecord51356806).b).c AS v;