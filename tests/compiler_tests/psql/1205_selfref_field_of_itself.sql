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
-- Synalog type: synalogrecord356312844
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord356312844') then create type synalogrecord356312844 as (a numeric); end if;
END $$;
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[0, 1]::numeric[]) as x_3
WHERE
  (ROW(x_3)::synalogrecord356312844 = ROW(x_3)::synalogrecord356312844) ORDER BY x;