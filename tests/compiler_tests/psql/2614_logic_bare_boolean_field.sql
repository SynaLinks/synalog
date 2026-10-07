-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord5728078375712330299') then create type logicarecord5728078375712330299 as ("ok" boolean); end if; END $$;
WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      ROW(false)::logicarecord5728078375712330299 AS r
   UNION ALL
  
    SELECT
      2 AS x,
      ROW(true)::logicarecord5728078375712330299 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  (V.r).ok;