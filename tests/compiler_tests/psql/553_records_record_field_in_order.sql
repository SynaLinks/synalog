-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord820338949
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord820338949') then create type logicarecord820338949 as (k numeric); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      ROW(2)::logicarecord820338949 AS r
   UNION ALL
  
    SELECT
      ROW(1)::logicarecord820338949 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (V.r).k AS k
FROM
  t_0_V AS V ORDER BY k;