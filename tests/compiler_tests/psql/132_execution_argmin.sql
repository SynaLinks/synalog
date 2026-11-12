-- Initializing PostgreSQL environment.
set client_min_messages to warning;
DO $$ BEGIN if not exists (select 1 from pg_namespace where nspname = 'synalog_home') then create schema synalog_home; end if; END $$;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_Price AS (SELECT * FROM (
  
    SELECT
      'pen' AS item,
      1 AS p
   UNION ALL
  
    SELECT
      'book' AS item,
      9 AS p
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (ARRAY_AGG(Price.item order by Price.p nulls last))[1] AS item
FROM
  t_1_Price AS Price;