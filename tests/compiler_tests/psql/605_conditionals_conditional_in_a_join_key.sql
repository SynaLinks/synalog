-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Name AS (SELECT * FROM (
  
    SELECT
      0 AS p,
      'even' AS n
   UNION ALL
  
    SELECT
      1 AS p,
      'odd' AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_6 AS x,
  Name.n AS n
FROM
  t_0_Name AS Name, UNNEST(ARRAY[1, 2]) as x_6
WHERE
  (Name.p = CASE WHEN ((MOD(CAST(x_6 AS numeric), NULLIF(CAST(2 AS numeric), 0))) = 0) THEN 0 ELSE 1 END) ORDER BY x;