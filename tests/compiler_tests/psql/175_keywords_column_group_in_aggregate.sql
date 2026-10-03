-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      'a' AS "group",
      1 AS v
   UNION ALL
  
    SELECT
      'a' AS "group",
      2 AS v
   UNION ALL
  
    SELECT
      'b' AS "group",
      4 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R."group" AS "group",
  SUM(R.v) AS total
FROM
  t_0_R AS R
GROUP BY R."group" ORDER BY "group";