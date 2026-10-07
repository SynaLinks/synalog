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
DROP TABLE IF EXISTS logica_home.G CASCADE;
CREATE TABLE logica_home.G AS SELECT
  x_6 AS k
FROM
  UNNEST(ARRAY[1]::numeric[]) as x_6;

-- Interacting with table logica_home.G

WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      'b' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  G.k AS k,
  N.s AS s
FROM
  logica_home.G AS G, t_0_N AS N
WHERE
  (N.k = G.k);