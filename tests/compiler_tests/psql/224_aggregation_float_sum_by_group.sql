-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      CAST(0.25 AS double precision) AS v
   UNION ALL
  
    SELECT
      'a' AS k,
      CAST(0.5 AS double precision) AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      CAST(0.5 AS double precision) AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R.k AS k,
  SUM(R.v) AS t
FROM
  t_0_R AS R
GROUP BY R.k ORDER BY k;