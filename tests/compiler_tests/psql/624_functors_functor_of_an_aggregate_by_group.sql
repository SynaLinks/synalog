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
WITH t_1_In1 AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      1 AS v
   UNION ALL
  
    SELECT
      'x' AS g,
      3 AS v
   UNION ALL
  
    SELECT
      'y' AS g,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_T1 AS (SELECT
  In1.g AS g,
  SUM(In1.v) AS t
FROM
  t_1_In1 AS In1
GROUP BY In1.g)
SELECT
  T1.g AS g,
  T1.t AS t
FROM
  t_0_T1 AS T1 ORDER BY g;