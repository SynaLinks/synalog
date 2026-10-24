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
END $$;
WITH t_0_W AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      2 AS x
   UNION ALL
  
    SELECT
      2 AS k,
      3 AS x
   UNION ALL
  
    SELECT
      3 AS k,
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W.k AS k,
  CASE WHEN (W.k = 3) THEN ((W.x) * (2)) ELSE ((W.x) * (W.x)) END AS v
FROM
  t_0_W AS W ORDER BY k;