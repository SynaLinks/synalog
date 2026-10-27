-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

SELECT
  x_33 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4, 5, 6, 7, 8]) as x_33
WHERE
  (x_33 IS DISTINCT FROM 15) AND
  (x_33 IS DISTINCT FROM 14) AND
  (x_33 IS DISTINCT FROM 13) AND
  (x_33 IS DISTINCT FROM 12) AND
  (x_33 IS DISTINCT FROM 11) AND
  (x_33 IS DISTINCT FROM 10) AND
  (x_33 IS DISTINCT FROM 9) AND
  (x_33 IS DISTINCT FROM 8) AND
  (x_33 IS DISTINCT FROM 7) AND
  (x_33 IS DISTINCT FROM 6) AND
  (x_33 IS DISTINCT FROM 5) AND
  (x_33 IS DISTINCT FROM 4) AND
  (x_33 IS DISTINCT FROM 3) AND
  (x_33 IS DISTINCT FROM 2) AND
  (x_33 IS DISTINCT FROM 1);