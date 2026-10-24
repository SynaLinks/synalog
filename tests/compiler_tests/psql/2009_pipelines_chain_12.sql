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
  x_27 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4, 5, 6, 7, 8]::numeric[]) as x_27
WHERE
  (x_27 != 12) AND
  (x_27 != 11) AND
  (x_27 != 10) AND
  (x_27 != 9) AND
  (x_27 != 8) AND
  (x_27 != 7) AND
  (x_27 != 6) AND
  (x_27 != 5) AND
  (x_27 != 4) AND
  (x_27 != 3) AND
  (x_27 != 2) AND
  (x_27 != 1);