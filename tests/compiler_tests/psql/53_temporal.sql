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
WITH t_1_Orders AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      '2024-01-15 10:30:00' AS created_at
   UNION ALL
  
    SELECT
      2 AS id,
      '2024-01-20 14:00:00' AS created_at
   UNION ALL
  
    SELECT
      3 AS id,
      '2024-02-05 09:15:00' AS created_at
  
) AS UNUSED_TABLE_NAME  ),
t_0_MonthlyCount AS (SELECT
  SUBSTR(CAST(Orders.created_at AS TEXT), 1, 7) AS month,
  SUM(1) AS count
FROM
  t_1_Orders AS Orders
GROUP BY SUBSTR(CAST(Orders.created_at AS TEXT), 1, 7) ORDER BY month)
SELECT
  MonthlyCount.month AS month,
  MonthlyCount.count AS count
FROM
  t_0_MonthlyCount AS MonthlyCount ORDER BY month;