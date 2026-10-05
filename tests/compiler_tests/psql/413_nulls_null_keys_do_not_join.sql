-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_A AS (SELECT * FROM (
  
    SELECT
      CAST(null AS numeric) AS k,
      0 AS a
   UNION ALL
  
    SELECT
      1 AS k,
      1 AS a
  
) AS UNUSED_TABLE_NAME  ),
t_3_B AS (SELECT * FROM (
  
    SELECT
      CAST(null AS numeric) AS k,
      0 AS b
   UNION ALL
  
    SELECT
      1 AS k,
      1 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_A.a AS a
FROM
  t_2_A AS t_0_A, t_3_B AS t_1_B
WHERE
  (t_1_B.k = t_0_A.k);