-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  providers.npi AS npi
FROM
  providers
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_10 = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    ground_truth, UNNEST(ARRAY[0]) as x_10
  WHERE
    (ARRAY[ROW(providers.npi)] = ARRAY[ROW(ground_truth.npi)]) AND
    (ARRAY[ROW(providers.scheme)] = ARRAY[ROW(ground_truth.scheme)])) AS numeric) IS NULL);