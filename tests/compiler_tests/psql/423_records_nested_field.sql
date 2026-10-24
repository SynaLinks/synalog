-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Synalog type: synalogrecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord481217614') then create type synalogrecord481217614 as (r synalogrecord893574736); end if;
-- Synalog type: synalogrecord958681958
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord958681958') then create type synalogrecord958681958 as (b numeric); end if;
-- Synalog type: synalogrecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord86796764') then create type synalogrecord86796764 as (s text); end if;
-- Synalog type: synalogrecord715995786
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord715995786') then create type synalogrecord715995786 as (a synalogrecord958681958); end if;
END $$;
SELECT
  (ROW(5)::synalogrecord958681958).b AS v;