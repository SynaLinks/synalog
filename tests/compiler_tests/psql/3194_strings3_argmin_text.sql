-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'b' AS w
   UNION ALL
  
    SELECT
      2 AS id,
      'B' AS w
   UNION ALL
  
    SELECT
      3 AS id,
      'c' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (ARRAY_AGG(V.id order by V.w nulls last))[1] AS id
FROM
  t_1_V AS V;