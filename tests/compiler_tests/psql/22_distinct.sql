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
WITH t_1_Data AS (SELECT * FROM (
  
    SELECT
      'A' AS category,
      1 AS value
   UNION ALL
  
    SELECT
      'A' AS category,
      2 AS value
   UNION ALL
  
    SELECT
      'A' AS category,
      1 AS value
   UNION ALL
  
    SELECT
      'B' AS category,
      1 AS value
   UNION ALL
  
    SELECT
      'B' AS category,
      1 AS value
  
) AS UNUSED_TABLE_NAME  ),
t_0_UniqueCategories AS (SELECT
  Data.category AS category
FROM
  t_1_Data AS Data
GROUP BY Data.category ORDER BY category)
SELECT
  UniqueCategories.category AS category
FROM
  t_0_UniqueCategories AS UniqueCategories ORDER BY category;