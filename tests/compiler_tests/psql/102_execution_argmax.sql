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
-- Logica type: logicarecord183863755
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord183863755') then create type logicarecord183863755 as (arg text, value numeric); end if;
-- Logica type: logicarecord462007516
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord462007516') then create type logicarecord462007516 as (argpod text); end if;
-- Logica type: logicarecord68214556
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord68214556') then create type logicarecord68214556 as (arg logicarecord462007516, value numeric); end if;
END $$;
WITH t_1_Score AS (SELECT * FROM (
  
    SELECT
      'a' AS name,
      1 AS s
   UNION ALL
  
    SELECT
      'b' AS name,
      5 AS s
   UNION ALL
  
    SELECT
      'c' AS name,
      3 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ((ARRAY_AGG(ROW(Score.name)::logicarecord462007516 order by Score.s desc))[1]).argpod AS name
FROM
  t_1_Score AS Score;