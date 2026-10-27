-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  SUM(1) AS n
FROM
  UNNEST(ARRAY['Apple', 'kiwi', 'Banana']) as x_2
WHERE
  (COALESCE(UPPER(LOWER(x_2)), '') = COALESCE(UPPER(x_2), '') AND (UPPER(LOWER(x_2)) IS NULL) = (UPPER(x_2) IS NULL));