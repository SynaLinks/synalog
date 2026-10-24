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
WITH t_0_City AS (SELECT * FROM (
  
    SELECT
      'paris' AS c,
      'fr' AS country
   UNION ALL
  
    SELECT
      'lyon' AS c,
      'fr' AS country
  
) AS UNUSED_TABLE_NAME  ),
t_1_Shop AS (SELECT * FROM (
  
    SELECT
      1 AS s,
      'paris' AS c
   UNION ALL
  
    SELECT
      2 AS s,
      'lyon' AS c
  
) AS UNUSED_TABLE_NAME  ),
t_2_Sale AS (SELECT * FROM (
  
    SELECT
      1 AS s,
      10 AS amount
   UNION ALL
  
    SELECT
      2 AS s,
      20 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  City.country AS country,
  SUM(Sale.amount) AS t
FROM
  t_0_City AS City, t_1_Shop AS Shop, t_2_Sale AS Sale
WHERE
  (Shop.c = City.c) AND
  (Sale.s = Shop.s)
GROUP BY City.country;