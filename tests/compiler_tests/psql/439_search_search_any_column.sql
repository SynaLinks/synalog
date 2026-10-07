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
WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      'xa' AS s,
      'q' AS t
   UNION ALL
  
    SELECT
      2 AS n,
      'b' AS s,
      'xy' AS t
   UNION ALL
  
    SELECT
      3 AS n,
      'c' AS s,
      'd' AS t
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.n AS n,
  V.s AS s,
  V.t AS t
FROM
  t_0_V AS V ORDER BY n;