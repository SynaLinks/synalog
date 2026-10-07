-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      'alpha' AS w
   UNION ALL
  
    SELECT
      'beta' AS w
   UNION ALL
  
    SELECT
      'gamma' AS w
   UNION ALL
  
    SELECT
      'delta' AS w
   UNION ALL
  
    SELECT
      'epsilon' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_W.w AS w,
  LENGTH(t_0_W.w) AS n
FROM
  t_1_W AS t_0_W ORDER BY w;