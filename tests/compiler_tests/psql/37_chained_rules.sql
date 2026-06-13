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
WITH t_0_Raw AS (SELECT * FROM (
  
    SELECT
      1 AS v
   UNION ALL
  
    SELECT
      2 AS v
   UNION ALL
  
    SELECT
      3 AS v
   UNION ALL
  
    SELECT
      4 AS v
   UNION ALL
  
    SELECT
      5 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Raw.v AS v,
  ((Raw.v) * (2)) AS doubled,
  ((((Raw.v) * (2))) + (10)) AS plus_ten
FROM
  t_0_Raw AS Raw
WHERE
  (Raw.v > 2) ORDER BY v;