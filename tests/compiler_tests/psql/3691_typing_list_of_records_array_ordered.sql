-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord1627638053154733253') then create type logicarecord1627638053154733253 as ("n" text); end if; END $$;
WITH t_4_V AS (SELECT * FROM (
  
    SELECT
      2 AS k,
      'a' AS n
   UNION ALL
  
    SELECT
      1 AS k,
      'b' AS n
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG(ROW(V.n)::logicarecord1627638053154733253 order by V.k) AS l
FROM
  t_4_V AS V)
SELECT
  ((t_0_L.l)[0 + 1]).n AS n
FROM
  t_1_L AS t_0_L;