-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord12133019138943447369') then create type logicarecord12133019138943447369 as ("xs" numeric[]); end if; END $$;
WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ROW(ARRAY[1, 2])::logicarecord12133019138943447369 AS r
   UNION ALL
  
    SELECT
      2 AS k,
      ROW(CAST('{}' AS numeric[]))::logicarecord12133019138943447369 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.k AS k,
  CARDINALITY((t_0_R.r).xs) AS n
FROM
  t_1_R AS t_0_R ORDER BY k;