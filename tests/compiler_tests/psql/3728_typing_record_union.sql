-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord1061218138678295706') then create type logicarecord1061218138678295706 as ("m" numeric, "xs" numeric[]); end if; END $$;
WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ROW(CAST(2.0 AS double precision), ARRAY[1, 2])::logicarecord1061218138678295706 AS r
   UNION ALL
  
    SELECT
      2 AS id,
      ROW(null, CAST('{}' AS numeric[]))::logicarecord1061218138678295706 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.id AS id,
  CARDINALITY((t_0_R.r).xs) AS n,
  (t_0_R.r).m AS m
FROM
  t_1_R AS t_0_R ORDER BY id;