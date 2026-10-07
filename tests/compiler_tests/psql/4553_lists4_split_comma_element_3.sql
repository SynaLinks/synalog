-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a,b,c' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      '' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      'abc' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      ',,' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      'x,' AS s
   UNION ALL
  
    SELECT
      6 AS k,
      CAST(null AS text) AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  ((CASE WHEN T.s = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY(T.s, ',') END))[3 + 1] AS v
FROM
  t_0_T AS T ORDER BY k;