-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord11818666937534187641') then create type logicarecord11818666937534187641 as ("n" numeric, "s" text); end if; END $$;
WITH t_4_N AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      'x' AS s
   UNION ALL
  
    SELECT
      2 AS n,
      'y' AS s
   UNION ALL
  
    SELECT
      3 AS n,
      'z' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_1_A AS (SELECT
  (ARRAY_AGG(ROW(t_2_N.n, t_2_N.s)::logicarecord11818666937534187641 order by t_2_N.n desc nulls last))[1] AS best
FROM
  t_4_N AS t_2_N)
SELECT
  (t_0_A.best).s AS s
FROM
  t_1_A AS t_0_A;