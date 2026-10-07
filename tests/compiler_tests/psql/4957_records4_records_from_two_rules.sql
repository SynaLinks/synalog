-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord13306261029667935468') then create type logicarecord13306261029667935468 as ("a" text, "l" numeric[]); end if; END $$;
WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ROW('x', ARRAY[1])::logicarecord13306261029667935468 AS r
   UNION ALL
  
    SELECT
      2 AS k,
      ROW(null, CAST('{}' AS numeric[]))::logicarecord13306261029667935468 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.k AS k,
  (t_0_R.r).a AS a,
  CARDINALITY((t_0_R.r).l) AS n
FROM
  t_1_R AS t_0_R ORDER BY k;