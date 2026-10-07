-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_F AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[3, 4] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      CAST('{}' AS numeric[]) AS l
   UNION ALL
  
    SELECT
      3 AS k,
      ARRAY[5] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  F.k AS k,
  CARDINALITY(F.l || ARRAY[9]) AS n
FROM
  t_0_F AS F ORDER BY k;