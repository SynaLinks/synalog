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
WITH t_1_Events AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      '2026-05-26' AS created
   UNION ALL
  
    SELECT
      2 AS id,
      '2025-01-01' AS created
  
) AS UNUSED_TABLE_NAME  ),
t_0_ThisYear AS (SELECT
  Events.id AS id
FROM
  t_1_Events AS Events, CurrentDate
WHERE
  (SUBSTR(Events.created, 1, 4) = SUBSTR(CurrentDate.date, 1, 4)) ORDER BY id)
SELECT
  ThisYear.id AS id
FROM
  t_0_ThisYear AS ThisYear ORDER BY id;