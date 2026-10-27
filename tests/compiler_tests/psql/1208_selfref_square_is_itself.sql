-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[0, 1, 2, 4]) as x_3
WHERE
  (COALESCE(x_3, 0) = COALESCE(((x_3) * (x_3)), 0) AND (x_3 IS NULL) = (((x_3) * (x_3)) IS NULL)) ORDER BY x;