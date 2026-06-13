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
-- Logica type: logicarecord922751334
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord922751334') then create type logicarecord922751334 as (a numeric, b numeric, c numeric); end if;
END $$;
WITH t_1_Record AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b,
      3 AS c
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b,
      6 AS c
  
) AS UNUSED_TABLE_NAME  ),
t_0_CopyAll AS (SELECT
  (Record).*
FROM
  t_1_Record AS Record ORDER BY a)
SELECT
  CopyAll.a AS a,
  CopyAll.b AS b,
  CopyAll.c AS c
FROM
  t_0_CopyAll AS CopyAll ORDER BY a;