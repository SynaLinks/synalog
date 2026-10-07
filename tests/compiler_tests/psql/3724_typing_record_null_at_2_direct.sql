-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord12759636318561132807') then create type logicarecord12759636318561132807 as ("x" numeric, "y" text); end if; END $$;
WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ROW(1, 'p')::logicarecord12759636318561132807 AS v
   UNION ALL
  
    SELECT
      2 AS k,
      ROW(2, 'q')::logicarecord12759636318561132807 AS v
   UNION ALL
  
    SELECT
      3 AS k,
      null AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.k AS k,
  (t_0_V.v).y AS r
FROM
  t_1_V AS t_0_V ORDER BY k;