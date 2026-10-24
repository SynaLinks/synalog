-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Total AS (SELECT
  SUM(x_8) AS t
FROM
  UNNEST(ARRAY[1, 3]) as x_8)
SELECT
  x_5 AS x,
  (CAST(CAST(x_5 AS double precision) AS double precision) / NULLIF(CAST(Total.t AS double precision), 0)) AS s
FROM
  t_0_Total AS Total, UNNEST(ARRAY[1, 3]) as x_5 ORDER BY x;