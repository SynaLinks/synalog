-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY['a', 'b'] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      CAST('{}' AS text[]) AS l
   UNION ALL
  
    SELECT
      3 AS k,
      CAST(null AS text[]) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.k AS k,
  CARDINALITY(S.l) AS n
FROM
  t_0_S AS S ORDER BY k;