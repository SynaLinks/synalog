-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord11809898602223998263') then create type logicarecord11809898602223998263 as ("argpod" text); end if; END $$;
WITH t_1_S AS (SELECT * FROM (
  
    SELECT
      1 AS "order",
      5 AS s
   UNION ALL
  
    SELECT
      2 AS "order",
      9 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ((ARRAY_AGG(ROW(S."order")::logicarecord11809898602223998263 order by S.s desc))[1]).argpod AS "order"
FROM
  t_1_S AS S;