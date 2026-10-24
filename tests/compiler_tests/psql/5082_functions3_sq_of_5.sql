-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Synalog type: synalogrecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord481217614') then create type synalogrecord481217614 as (r synalogrecord893574736); end if;
-- Synalog type: synalogrecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord86796764') then create type synalogrecord86796764 as (s text); end if;
-- Synalog type: synalogrecord6083990
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord6083990') then create type synalogrecord6083990 as (x numeric, y numeric); end if;
END $$;
SELECT
  ((5) * (5)) AS s,
  SQRT(((((5) * (5))) + (((4) * (4))))) AS h,
  CASE WHEN (5 > 0) THEN 1 WHEN (5 < 0) THEN -1 ELSE 0 END AS g;