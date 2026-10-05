-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_M AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  M.k AS k,
  SUM(1) AS n
FROM
  t_1_M AS M, UNNEST(ARRAY[1, 2]) as x_4
WHERE
  (x_4 = M.k)
GROUP BY M.k ORDER BY k;