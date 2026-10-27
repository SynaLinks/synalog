-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  1 AS ok
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (COALESCE(COALESCE(null, 5), 0) = COALESCE(COALESCE(null, 5), 0) AND (COALESCE(null, 5) IS NULL) = (COALESCE(null, 5) IS NULL));