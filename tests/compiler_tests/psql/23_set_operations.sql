-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_6 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4, 5]) as x_6, UNNEST(ARRAY[3, 4, 5, 6, 7]) as x_8
WHERE
  (COALESCE(x_8, 0) = COALESCE(x_6, 0) AND (x_8 IS NULL) = (x_6 IS NULL)) ORDER BY x;