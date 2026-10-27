-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord10303692402198018067') then create type synalogrecord10303692402198018067 as ("a" numeric); end if; END $$;
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[0, 1]) as x_3
WHERE
  (ARRAY[ROW(ROW(x_3)::synalogrecord10303692402198018067)] = ARRAY[ROW(ROW(x_3)::synalogrecord10303692402198018067)]) ORDER BY x;