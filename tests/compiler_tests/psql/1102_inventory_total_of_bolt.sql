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
WITH t_0_Stock AS (SELECT * FROM (
  
    SELECT
      'north' AS warehouse,
      'bolt' AS item,
      120 AS qty
   UNION ALL
  
    SELECT
      'north' AS warehouse,
      'nut' AS item,
      40 AS qty
   UNION ALL
  
    SELECT
      'north' AS warehouse,
      'gear' AS item,
      5 AS qty
   UNION ALL
  
    SELECT
      'south' AS warehouse,
      'bolt' AS item,
      30 AS qty
   UNION ALL
  
    SELECT
      'south' AS warehouse,
      'gear' AS item,
      12 AS qty
   UNION ALL
  
    SELECT
      'south' AS warehouse,
      'belt' AS item,
      7 AS qty
   UNION ALL
  
    SELECT
      'east' AS warehouse,
      'nut' AS item,
      15 AS qty
   UNION ALL
  
    SELECT
      'east' AS warehouse,
      'belt' AS item,
      2 AS qty
   UNION ALL
  
    SELECT
      'east' AS warehouse,
      'chain' AS item,
      9 AS qty
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(Stock.qty) AS n
FROM
  t_0_Stock AS Stock
WHERE
  (Stock.item = 'bolt');