-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_9 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4, 5, 6, 7, 8]) as x_9
WHERE
  (x_9 IS DISTINCT FROM 3) AND
  (x_9 IS DISTINCT FROM 2) AND
  (x_9 IS DISTINCT FROM 1) ORDER BY x;