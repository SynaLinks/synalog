-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_P AS (SELECT * FROM (
  
    SELECT
      'a' AS name,
      100 AS score
   UNION ALL
  
    SELECT
      'b' AS name,
      20 AS score
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.name AS name,
  P.score AS score
FROM
  t_1_P AS P ORDER BY score;
