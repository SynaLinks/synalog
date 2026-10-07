-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_M AS (SELECT * FROM (
  
    SELECT
      1 AS "order"
   UNION ALL
  
    SELECT
      2 AS "order"
  
) AS UNUSED_TABLE_NAME  )
SELECT
  M."order" AS "order",
  'a' AS v
FROM
  t_0_M AS M
WHERE
  (1 = M."order");