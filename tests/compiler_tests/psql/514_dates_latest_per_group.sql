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
      'a' AS g,
      '2024-01-01' AS d
   UNION ALL
  
    SELECT
      'a' AS g,
      '2024-05-01' AS d
   UNION ALL
  
    SELECT
      'b' AS g,
      '2023-01-01' AS d
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  MAX(V.d) AS d
FROM
  t_0_V AS V
GROUP BY V.g ORDER BY g;