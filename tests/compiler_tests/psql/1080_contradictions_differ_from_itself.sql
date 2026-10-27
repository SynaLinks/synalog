-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_4 AS a
FROM
  UNNEST(ARRAY[1, 2]) as x_4, UNNEST(ARRAY[1, 2]) as x_6
WHERE
  (x_6 IS DISTINCT FROM x_4) AND
  (COALESCE(x_4, 0) = COALESCE(x_6, 0) AND (x_4 IS NULL) = (x_6 IS NULL));