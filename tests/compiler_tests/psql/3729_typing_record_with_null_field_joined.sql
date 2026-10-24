-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Synalog type: synalogrecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord481217614') then create type synalogrecord481217614 as (r synalogrecord893574736); end if;
-- Synalog type: synalogrecord996523445
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord996523445') then create type synalogrecord996523445 as (v numeric); end if;
-- Synalog type: synalogrecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord86796764') then create type synalogrecord86796764 as (s text); end if;
END $$;
WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ROW(null)::synalogrecord996523445 AS r
   UNION ALL
  
    SELECT
      2 AS k,
      ROW(3)::synalogrecord996523445 AS r
  
) AS UNUSED_TABLE_NAME  ),
t_1_B AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.k AS k
FROM
  t_0_A AS A, t_1_B AS B
WHERE
  ((A.r).v IS null) AND
  (B.k = A.k);