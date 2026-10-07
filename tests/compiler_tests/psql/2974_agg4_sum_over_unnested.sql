-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_L AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      ARRAY[1, 2, 3] AS l
   UNION ALL
  
    SELECT
      'b' AS k,
      ARRAY[10] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  SUM(x_3) AS t
FROM
  t_1_L AS t_0_L, UNNEST(t_0_L.l) as x_3
GROUP BY t_0_L.k ORDER BY k, t;