-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Line AS (SELECT * FROM (
  
    SELECT
      10 AS "order",
      'paid' AS "select"
   UNION ALL
  
    SELECT
      11 AS "order",
      'open' AS "select"
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Line."order" AS "order"
FROM
  t_0_Line AS Line
WHERE
  (Line."select" = 'paid');