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
WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS name
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS name
  
) AS UNUSED_TABLE_NAME  ),
t_1_O AS (SELECT * FROM (
  
    SELECT
      1 AS pid,
      10 AS amount
   UNION ALL
  
    SELECT
      1 AS pid,
      20 AS amount
   UNION ALL
  
    SELECT
      2 AS pid,
      5 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.name AS name,
  SUM(O.amount) AS total
FROM
  t_0_P AS P, t_1_O AS O
WHERE
  (O.pid = P.id)
GROUP BY P.name ORDER BY name;