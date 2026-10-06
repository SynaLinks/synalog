-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_4_V AS (SELECT * FROM (
  
    SELECT
      'b' AS w
   UNION ALL
  
    SELECT
      'a' AS w
   UNION ALL
  
    SELECT
      'B' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG(V.w order by V.w) AS l
FROM
  t_4_V AS V)
SELECT
  ARRAY_TO_STRING(t_0_L.l, ',') AS s
FROM
  t_1_L AS t_0_L;