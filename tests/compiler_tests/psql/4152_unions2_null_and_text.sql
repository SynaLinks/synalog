-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      CAST(null AS text) AS s
   UNION ALL
  
    SELECT
      x_6 AS k,
      CASE WHEN (x_6 = 2) THEN 'b' ELSE 'c' END AS s
    FROM
      UNNEST(ARRAY[2, 3]) as x_6
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.k AS k,
  U.s AS s
FROM
  t_0_U AS U ORDER BY k;