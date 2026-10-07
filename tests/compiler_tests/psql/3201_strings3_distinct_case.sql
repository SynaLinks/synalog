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
WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS w
   UNION ALL
  
    SELECT
      'A' AS w
   UNION ALL
  
    SELECT
      'a' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_D AS (SELECT
  V.w AS w
FROM
  t_1_V AS V
GROUP BY V.w)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;