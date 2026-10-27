-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  SUM(1) AS n
FROM
  (SELECT current_timestamp AT TIME ZONE 'UTC' AS timestamp) AS Now, (SELECT to_char(current_timestamp AT TIME ZONE 'UTC', 'YYYY-MM-DD') AS date) AS Today
WHERE
  (COALESCE(SUBSTR(CAST(Now.timestamp AS TEXT), 1, 10), '') = COALESCE(Today.date, '') AND (SUBSTR(CAST(Now.timestamp AS TEXT), 1, 10) IS NULL) = (Today.date IS NULL));
