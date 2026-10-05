-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
WITH t_0_HasPhone AS (SELECT * FROM (
  
    SELECT
      'a1' AS account,
      '555-1' AS phone
   UNION ALL
  
    SELECT
      'a2' AS account,
      '555-1' AS phone
   UNION ALL
  
    SELECT
      'a2' AS account,
      '555-2' AS phone
   UNION ALL
  
    SELECT
      'a3' AS account,
      '555-2' AS phone
   UNION ALL
  
    SELECT
      'a4' AS account,
      '555-3' AS phone
   UNION ALL
  
    SELECT
      'a5' AS account,
      '555-4' AS phone
   UNION ALL
  
    SELECT
      'a6' AS account,
      '555-4' AS phone
   UNION ALL
  
    SELECT
      'a7' AS account,
      '555-9' AS phone
  
) AS UNUSED_TABLE_NAME  )
SELECT
  HasPhone.account AS account,
  SUM(1) AS n
FROM
  t_0_HasPhone AS HasPhone
GROUP BY HasPhone.account ORDER BY account;