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
SELECT
  CAST((SELECT
  SUM((CASE WHEN x_5 = 0 THEN 1 ELSE NULL END)) AS logica_value
FROM
  UNNEST(ARRAY[0]::numeric[]) as x_5, UNNEST(ARRAY[1, 2, 3]::numeric[]) as x_7, UNNEST(ARRAY[2, 3, 4]::numeric[]) as x_9
WHERE
  (x_9 = x_7)) AS numeric) AS n;