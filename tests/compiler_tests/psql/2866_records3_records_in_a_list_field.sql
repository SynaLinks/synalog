-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord1627638053154733253') then create type logicarecord1627638053154733253 as ("n" text); end if; END $$;
DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord18320442713465653467') then create type logicarecord18320442713465653467 as ("items" logicarecord1627638053154733253[], "name" text); end if; END $$;
WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      ROW(ARRAY[ROW('p')::logicarecord1627638053154733253, ROW('q')::logicarecord1627638053154733253], 'a')::logicarecord18320442713465653467 AS r
   UNION ALL
  
    SELECT
      ROW(ARRAY[ROW('r')::logicarecord1627638053154733253], 'b')::logicarecord18320442713465653467 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (T.r).name AS name,
  (x_1).n AS item
FROM
  t_0_T AS T, LATERAL (SELECT UNNEST((T.r).items) AS x_1) AS pushkin_x_1 ORDER BY name, item;