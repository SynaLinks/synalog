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
WITH t_1_Data AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      10 AS value
   UNION ALL
  
    SELECT
      2 AS id,
      null AS value
   UNION ALL
  
    SELECT
      3 AS id,
      30 AS value
  
) AS UNUSED_TABLE_NAME  ),
t_0_Flags AS (SELECT
  Data.id AS id,
  (Data.value IS NULL) AS missing
FROM
  t_1_Data AS Data ORDER BY id)
SELECT
  Flags.id AS id,
  Flags.missing AS missing
FROM
  t_0_Flags AS Flags ORDER BY id;