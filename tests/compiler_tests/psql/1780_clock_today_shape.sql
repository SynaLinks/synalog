-- Initializing PostgreSQL environment.
set client_min_messages to warning;
DO $$ BEGIN if not exists (select 1 from pg_namespace where nspname = 'synalog_home') then create schema synalog_home; end if; END $$;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  LENGTH(Today.date) AS n,
  SUBSTR(Today.date, 5, 1) AS a,
  SUBSTR(Today.date, 8, 1) AS b
FROM
  (SELECT to_char(current_timestamp AT TIME ZONE 'UTC', 'YYYY-MM-DD') AS date) AS Today;
