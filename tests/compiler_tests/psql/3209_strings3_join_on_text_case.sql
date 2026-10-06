-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_B AS (SELECT * FROM (
  
    SELECT
      'x' AS k,
      10 AS b
   UNION ALL
  
    SELECT
      'X' AS k,
      20 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  1 AS a,
  t_1_B.b AS b
FROM
  t_2_B AS t_1_B
WHERE
  (t_1_B.k = 'x');