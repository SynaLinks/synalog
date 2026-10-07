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
WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS k1,
      1 AS k2,
      'x' AS v
   UNION ALL
  
    SELECT
      1 AS k1,
      2 AS k2,
      'y' AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.v AS v
FROM
  t_0_A AS A
WHERE
  (A.k1 = 1) AND
  (A.k2 = 1);