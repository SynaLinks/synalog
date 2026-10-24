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
WITH t_1_Sales AS (SELECT * FROM (
  
    SELECT
      'Electronics' AS category,
      500 AS amount
   UNION ALL
  
    SELECT
      'Electronics' AS category,
      300 AS amount
   UNION ALL
  
    SELECT
      'Books' AS category,
      50 AS amount
   UNION ALL
  
    SELECT
      'Books' AS category,
      75 AS amount
   UNION ALL
  
    SELECT
      'Clothing' AS category,
      200 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_CategorySummary AS (SELECT
  Sales.category AS category,
  SUM(Sales.amount) AS total,
  SUM(CASE WHEN (Sales.amount >= 200) THEN 1 ELSE 0 END) AS high_value_count
FROM
  t_1_Sales AS Sales
GROUP BY Sales.category ORDER BY category)
SELECT
  CategorySummary.category AS category,
  CategorySummary.total AS total,
  CategorySummary.high_value_count AS high_value_count
FROM
  t_0_CategorySummary AS CategorySummary ORDER BY category;