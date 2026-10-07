-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_N AS (SELECT * FROM (
  
    SELECT
      1 AS n
   UNION ALL
  
    SELECT
      2 AS n
   UNION ALL
  
    SELECT
      3 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS k
FROM
  t_3_N AS t_0_N, t_3_N AS t_1_N, t_3_N AS t_2_N
WHERE
  (((t_0_N.n) + (t_1_N.n)) = t_2_N.n);