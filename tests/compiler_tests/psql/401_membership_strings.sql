-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_2 AS s
FROM
  UNNEST(ARRAY['b', 'c']) as x_2, UNNEST(ARRAY['a', 'b']) as x_4
WHERE
  (COALESCE(x_4, '') = COALESCE(x_2, '') AND (x_4 IS NULL) = (x_2 IS NULL));