-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Synalog type: synalogrecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord481217614') then create type synalogrecord481217614 as (r synalogrecord893574736); end if;
-- Synalog type: synalogrecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord86796764') then create type synalogrecord86796764 as (s text); end if;
-- Synalog type: synalogrecord829297287
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord829297287') then create type synalogrecord829297287 as (a text, b numeric); end if;
END $$;
WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ROW('x', 1)::synalogrecord829297287 AS r
   UNION ALL
  
    SELECT
      2 AS k,
      ROW(null, 2)::synalogrecord829297287 AS r
   UNION ALL
  
    SELECT
      3 AS k,
      ROW('z', null)::synalogrecord829297287 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  N.k AS k,
  (N.r).a AS a
FROM
  t_0_N AS N ORDER BY k;