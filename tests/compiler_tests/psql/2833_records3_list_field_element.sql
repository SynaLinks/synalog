-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord7601809876318556955') then create type logicarecord7601809876318556955 as ("name" text, "xs" numeric[]); end if; END $$;
WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ROW('a', ARRAY[1, 2, 3])::logicarecord7601809876318556955 AS r
   UNION ALL
  
    SELECT
      2 AS k,
      ROW('b', ARRAY[4])::logicarecord7601809876318556955 AS r
   UNION ALL
  
    SELECT
      3 AS k,
      ROW('c', CAST('{}' AS numeric[]))::logicarecord7601809876318556955 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.k AS k,
  ((S.r).xs)[1 + 1] AS e
FROM
  t_0_S AS S ORDER BY k;