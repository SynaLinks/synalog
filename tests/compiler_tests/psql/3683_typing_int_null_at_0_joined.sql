-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_K AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
   UNION ALL
  
    SELECT
      3 AS k
  
) AS UNUSED_TABLE_NAME  ),
t_3_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      CAST(null AS numeric) AS v
   UNION ALL
  
    SELECT
      2 AS k,
      4 AS v
   UNION ALL
  
    SELECT
      3 AS k,
      7 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_K.k AS k,
  t_1_V.v AS r
FROM
  t_2_K AS t_0_K, t_3_V AS t_1_V
WHERE
  (t_1_V.k = t_0_K.k) ORDER BY k;