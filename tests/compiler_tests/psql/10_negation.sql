-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_10 AS col0
FROM
  UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_10, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_12
WHERE
  (x_12 > 5) AND
  (COALESCE(x_12, 0) = COALESCE(x_10, 0) AND (x_12 IS NULL) = (x_10 IS NULL)) AND
  ((MOD(CAST(x_10 AS numeric), NULLIF(CAST(2 AS numeric), 0))) = 0) ORDER BY col0;