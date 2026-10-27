-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  1 AS a
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_5 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    UNNEST(ARRAY[0]) as x_5) AS numeric) IS NULL);