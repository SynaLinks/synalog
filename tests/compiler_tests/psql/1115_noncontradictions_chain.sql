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
END $$;
SELECT
  x_7 AS a,
  x_9 AS b,
  x_11 AS c
FROM
  UNNEST(ARRAY[1, 2, 3]::numeric[]) as x_11, UNNEST(ARRAY[1, 2, 3]::numeric[]) as x_7, UNNEST(ARRAY[1, 2, 3]::numeric[]) as x_9
WHERE
  (x_7 < x_9) AND
  (x_9 < x_11);