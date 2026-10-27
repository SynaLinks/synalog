-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY['a', 'B', 'c']) as x_1
WHERE
  (COALESCE(x_1, '') = COALESCE(LOWER(x_1), '') AND (x_1 IS NULL) = (LOWER(x_1) IS NULL)) ORDER BY s;