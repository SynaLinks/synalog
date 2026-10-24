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
-- Synalog type: synalogrecord986930601
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord986930601') then create type synalogrecord986930601 as (hi numeric, lo numeric); end if;
END $$;
WITH t_0_S AS (SELECT
  MIN(x_5) AS lo,
  MAX(x_5) AS hi
FROM
  UNNEST(ARRAY[1, 2, 3]::numeric[]) as x_5)
SELECT
  S.lo AS lo,
  S.hi AS hi
FROM
  t_0_S AS S;